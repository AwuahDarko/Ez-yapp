import 'package:esayapp/services/web.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:io' show Platform;
import 'dart:convert';
import 'package:flutter/material.dart';

class Socket {
  static IO.Socket socket = IO.io(Web.url, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false,
    'forceNew': true
  });

  static void connectSocket() {
    if (!socket.connected) {
      socket.connect();

      socket.on('connect', (_) => print('connected to socket ====: ${socket.id}'));
      // socket.onConnect((data) => print('connected'));

    }
  }

  // you may call this in dispose method of a widget
  static void disconnectSocket() {
    if (Platform.isIOS) {
      socket.dispose();
    } else {
      socket.disconnect();
      socket.destroy();
    }
  }

  // use this to listen to events from the socket
  static void socketRegisterChannel(String channel, {required Function(dynamic) onMessageReceived}) {
    socket.on(channel, (dataFromSocket) {
      print("socket message => $dataFromSocket");
      onMessageReceived(dataFromSocket);
    });
  }

  // use this to listen to events from the socket and passing context in case you want
  // to do something with the context
  static void socketRegisterChannelWithContext(BuildContext context, String channel,
      {required Function(dynamic) onMessageReceived}) {
    socket.on(channel, (dataFromSocket) {
      print(dataFromSocket);
      onMessageReceived(dataFromSocket);
    });
  }

  static void sendSocketMessage(String channel, Map<String, dynamic> message) {
    String jsonData = jsonEncode(message);
    socket.emit(channel, jsonData);
  }
}
