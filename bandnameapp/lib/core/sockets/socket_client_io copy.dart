import 'package:socket_io_client/socket_io_client.dart';
import 'package:bandnameapp/core/errors/exceptions.dart';
import 'package:bandnameapp/core/sockets/socket.dart';

class SocketClientIOCopy implements SocketService {
  late Socket _socket;

  Socket get socket => _socket;

  static final SocketClientIOCopy _instance = SocketClientIOCopy._internal();

  SocketClientIOCopy._internal() {
    initConfing();
    print('<SocketClientIO> creation');
  }

  factory SocketClientIOCopy() => _instance;

  @override
  void initConfing() {
    _socket = io('http://10.0.2.2:3000/', {
      'transports': ['websocket'],
      'autoConnect': true
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
  bool sendData(String event, [dynamic data]) {
    if (_socket.disconnected) {
      return false;
    }
    try {
      _socket.emit(event, data);
    } catch (e) {
      throw SocketException();
    }
    return true;
  }
  @override
  var service;
}
