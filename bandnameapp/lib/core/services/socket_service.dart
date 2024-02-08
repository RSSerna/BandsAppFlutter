import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { online, oflline, connecting }

class SocketService with ChangeNotifier {
  // ServerStatus _serverStatus = ServerStatus.connecting;

  SocketService() {
    _initConfing();
  }
  void _initConfing() {
    // Dart client
    IO.Socket socket = IO.io('http://localhost:3000', {
      'transports': ['websocket'],
      'autoConnect': true
    });

    // IO.Socket socket = IO.io(
    //     'http://localhost:3000',
    //     IO.OptionBuilder()
    //         .setTransports(['websocket']) // for Flutter or Dart VM
    //         .enableAutoConnect()
    //         .build());

    socket.onConnect((_) {
      print('connect');
      socket.emit('msg', 'test');
    });
    
    socket.onDisconnect((_) => print('disconnect'));
  }
}
