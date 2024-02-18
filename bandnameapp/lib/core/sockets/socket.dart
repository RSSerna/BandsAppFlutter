abstract class SocketService<S> {
  late S _service;
  S get service => _service;
  void connect();
  void disconnect();
  bool sendData(String event, [dynamic data]);
  void initConfing();
}

enum SocketResponse { sended, notsended }
