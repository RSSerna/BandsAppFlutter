import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';

abstract class SocketService {
  // late final StreamController socketClientIOStreamController =
  //     StreamController.broadcast();

  // StreamController get socketClientIOStreamController =>
  //     _socketClientIOStreamController;

  void connect() {}
  void disconnect() {}
  void sendData(String event, [dynamic data]) {}
  void onConnect() {}
  void onDisconnect() {}
  void initConfing() {}
  void setServiceBloc(SocketServiceBloc serviceBloc) {}
}
