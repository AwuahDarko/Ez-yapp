import 'package:equatable/equatable.dart';

class Device extends Equatable {
  String? name;
  int? id;
  int? clientStatus;
  int? boardStatus;
  String? clientRequestAt;
  String? boardResponseAt;
  String? createdAt;
  String status = '';

  Device(Map<String, dynamic> map) {
    name = map['board_name'] ?? '';
    id = map['id'] ?? 0;
    clientStatus = map['client_status'] ?? 0;
    boardStatus = map['board_status'] ?? 0;
    clientRequestAt = map['client_request_at'] ?? '';
    boardResponseAt = map['board_response_at'] ?? '';
    createdAt = map['created_at'] ?? '';
    boardStatus == 0 ? status = 'OFF' : status = 'ON';
  }

  @override
  List<Object?> get props =>
      [id, name, clientStatus, boardStatus, clientRequestAt, boardResponseAt, createdAt, status];
}
