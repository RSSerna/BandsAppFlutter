import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'package:bandnameapp/core/sockets/socket.dart';

class SocketClientIO implements SocketService {
  late io.Socket socket;

  final SocketServiceBloc socketServiceBloc;

  SocketClientIO(this.socketServiceBloc) {
    initConfing();
  }

  @override
  void initConfing() {
    socket = io.io('http://localhost:3000', {
      'transports': ['websocket'],
      'autoConnect': true
    });
  }

  @override
  void connect() {
    socket.connect();
  }

  @override
  void disconnect() {
    socket.disconnect();
  }

  @override
  void sendData(String event, [dynamic data]) {
    socket.emit(event, data);
  }

  @override
  void onConnect() {
    socket.onConnect((_) {
      socketServiceBloc.add(SocketServiceSetConnectionEvent(isConnected: true));
      print('connect');
    });
  }

  @override
  void onDisconnect() {
    socket.onDisconnect((_) {
      socketServiceBloc.add(SocketServiceSetConnectionEvent(isConnected: true));
      print('disconnect');
    });
  }
}
