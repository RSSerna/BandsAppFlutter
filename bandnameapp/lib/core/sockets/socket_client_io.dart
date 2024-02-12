import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:bandnameapp/core/sockets/socket.dart';
import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';

class SocketClientIO implements SocketService {
  late io.Socket _socket;

  io.Socket get socket => _socket;

  SocketServiceBloc? socketServiceBloc;

  static final SocketClientIO _instance = SocketClientIO._internal();

  SocketClientIO._internal() {
    initConfing();
    print('<SocketClientIO> creation');
  }

  factory SocketClientIO() => _instance;

  @override
  void setServiceBloc(SocketServiceBloc serviceBloc) {
    if (_instance.socketServiceBloc == null) {
      print('SetServiceBloc');
      _instance.socketServiceBloc ??= serviceBloc;
    }
  }

  @override
  void initConfing() {
    _socket = io.io('http://10.0.2.2:3000/', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    _socket.onConnect((_) {
      onConnect();
    });

    _socket.onDisconnect((_) {
      onDisconnect();
    });
  }

  @override
  void connect() {
    _socket.connect();
  }

  @override
  void disconnect() {
    _socket.disconnect();
  }

  @override
  void sendData(String event, [dynamic data]) {
    _socket.emit(event, data);
  }

  @override
  void onConnect() {
    print('connect');

    _socket.emit('mensaje', {'nombre': 'Conexion Flutter'});
  }

  @override
  void onDisconnect() {
    print('disconnect');
    if (socketServiceBloc == null) {
      return;
    }
    socketServiceBloc!.add(SocketServiceSetConnectionEvent(isConnected: true));
  }
}
