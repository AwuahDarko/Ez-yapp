import 'package:equatable/equatable.dart';
import 'package:esayapp/models/device.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class TurnOnDevice extends DeviceEvent {
  final Device device;

  const TurnOnDevice(this.device);

  @override
  List<Object> get props => [device];
}

class TurnOffDevice extends DeviceEvent {
  final Device device;

  const TurnOffDevice(this.device);

  @override
  List<Object> get props => [device];
}

class LoadDevices extends DeviceEvent {
  const LoadDevices();

  @override
  List<Object> get props => [];
}

class ReadAtIntervals extends DeviceEvent{
  const ReadAtIntervals();

  @override
  List<Object> get props => [];
}
