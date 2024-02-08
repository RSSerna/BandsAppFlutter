abstract class SocketService {
  void connect() {}
  void disconnect() {}
  void sendData(String event, [dynamic data]) {}
  void onConnect() {}
  void onDisconnect() {}
  void initConfing() {}
}
