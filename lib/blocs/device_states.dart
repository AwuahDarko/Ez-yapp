import 'package:equatable/equatable.dart';
import 'package:esayapp/models/device.dart';
import 'package:flutter/material.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

class DeviceUninitialized extends DeviceState {}

class DeviceFetching extends DeviceState {}

class DeviceFetched extends DeviceState {
  final List<Device> devices;

  const DeviceFetched(this.devices);

  @override
  List<Object> get props => [devices];
}

class DeviceError extends DeviceState {
  final String error;

  const DeviceError(this.error);

  @override
  List<Object> get props => [error];
}

class DeviceEmpty extends DeviceState {
  final List<Device> devices;

  const DeviceEmpty(this.devices);

  @override
  List<Object> get props => [devices];
}

class DeviceChange extends DeviceState{
  final List<Device> devices;
  final String message;

  const DeviceChange(this.devices, this.message);

  @override
  List<Object> get props => [devices, message];
}
