import 'package:bandnameapp/core/functionalSocket/functional_socket.dart';
import 'package:bandnameapp/core/functionalSocket/functional_socket_io_client_impl.dart';

void main() {
  FunctionalSocket functionalSocket = FunctionalSocketIOClientImpl();
  functionalSocket.eventStream.listen((event) {
    FunctionalSocketEventEnum eventEnum = event.functionalSocketEventEnum;
    switch (eventEnum) {
      case FunctionalSocketEventEnum.onConnected:
        print('Connected from main not socket xdxdxd');
        break;
      case FunctionalSocketEventEnum.onDisconected:
        print('Disconnected from main not socket xdxdxd');
        break;
      case FunctionalSocketEventEnum.activeBands:
        print('Active Bands: ${event.data}');
        break;
      default:
    }
  });
}
