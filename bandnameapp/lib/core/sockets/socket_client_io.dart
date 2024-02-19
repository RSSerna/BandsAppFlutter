import 'package:socket_io_client/socket_io_client.dart';
import 'package:bandnameapp/core/errors/exceptions.dart';
import 'package:bandnameapp/core/sockets/socket.dart';

class SocketClientIO implements SocketService<Socket> {
  static final SocketClientIO _instance = SocketClientIO._internal();

  SocketClientIO._internal() {
    initConfing();
    print('<SocketClientIO> creation');
  }

  factory SocketClientIO() => _instance;

  late Socket _service;

  @override
  Socket get service => _service;

  @override
  void initConfing() {
    _service = io('http://10.0.2.2:3000/', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    _service.onDisconnect((data) => print('disconected'));
    // _service.ondisconnect();
  }

  @override
  void connect() {
    _service.connect();
  }

  @override
  void disconnect() {
    _service.disconnect();
  }

  @override
  bool sendData(String event, [dynamic data]) {
    if (_service.disconnected) {
      return false;
    }
    try {
      _service.emit(event, data);
    } catch (e) {
      throw SocketException();
    }
    return true;
  }
}
