import 'dart:async';

import 'package:esayapp/blocs/device_event.dart';
import 'package:esayapp/blocs/device_states.dart';
import 'package:esayapp/models/device.dart';
import 'package:esayapp/providers/device_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  final DeviceProvider _deviceProvider = DeviceProvider();
  late Timer timer;

  DeviceBloc() : super(DeviceUninitialized()) {

    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
          add(const ReadAtIntervals());
        });

    on<LoadDevices>((event, emit) async {
      try {
        emit(DeviceFetching());
        List<Device> devices = await _deviceProvider.fetchDevices();
        emit(DeviceFetched(devices));
      } catch (e) {
        emit(DeviceError(e.toString()));
      }
    });

    on<TurnOffDevice>((event, Emitter<DeviceState>emit) async {
      try {
          Map<String, dynamic> body = {"client_status": 0, "id": event.device.id};
          Map<String, dynamic> res = await _deviceProvider.setDeviceStatus(body);
        if (state is DeviceFetched) {
          final state = this.state as DeviceFetched;
          int index = state.devices.indexOf(event.device);

          if (index < 0) return;

          state.devices[index] = event.device;
          emit(DeviceChange(List.from(state.devices), res['message']));
        }else if (state is DeviceChange) {
          final state = this.state as DeviceChange;
          int index = state.devices.indexOf(event.device);

          if (index < 0) return;

          state.devices[index] = event.device;
          emit(DeviceChange(List.from(state.devices), res['message']));
        }
      } catch (e) {
        emit(DeviceError(e.toString()));
      }
    });

    on<TurnOnDevice>((event, emit) async {
      try {
        Map<String, dynamic> body = {"client_status": 1, "id": event.device.id};
        Map<String, dynamic> res = await _deviceProvider.setDeviceStatus(body);

        if (state is DeviceFetched) {
          final state = this.state as DeviceFetched;
          int index = state.devices.indexOf(event.device);

          if (index < 0) return;

          state.devices[index] = event.device;
          emit(DeviceChange(List.from(state.devices), res['message']));
        } else if (state is DeviceChange) {
          final state = this.state as DeviceChange;
          int index = state.devices.indexOf(event.device);

          if (index < 0) return;

          state.devices[index] = event.device;
          emit(DeviceChange(List.from(state.devices), res['message']));
        }
      } catch (e) {
        emit(DeviceError(e.toString()));
      }
    });

    on<ReadAtIntervals>((event, emit) async{
      try {
        List<Device> devices = await _deviceProvider.fetchDevices();
        emit(DeviceFetched(devices));
      } catch (e) {
        // emit(DeviceError(e.toString()));
      }
    });
  }
}
