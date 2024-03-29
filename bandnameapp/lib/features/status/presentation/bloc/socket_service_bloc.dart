// ignore_for_file: avoid_print
import 'package:bandnameapp/core/functionalSocket/functional_socket.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:bandnameapp/core/sockets/socket.dart';

part 'socket_service_bloc_event.dart';
part 'socket_service_bloc_state.dart';

class SocketServiceBloc
    extends Bloc<SocketServiceBlocEvent, SocketServiceBlocState> {
  final SocketService<Socket> socketService;
  final FunctionalSocket functionalSocket;

  SocketServiceBloc(
      {required this.socketService, required this.functionalSocket})
      : super(SocketDisconnectedState()) {
    _initSocketConfig();
    print('SocketServiceBLoC Created');

    on<SocketServiceSetConnectionEvent>((event, emit) {
      event.isConnected
          ? emit(SocketConnectedState())
          : emit(SocketDisconnectedState());
    });
  }

  void _initSocketConfig() {
    // SocketClientIO().service.onConnect((payload) {
    //   add(SocketServiceSetConnectionEvent(isConnected: true));
    // });
    // SocketClientIO().service.onDisconnect((payload) {
    //   add(SocketServiceSetConnectionEvent(isConnected: false));
    // });
    // socketService.service.onConnect((payload) {
    //   print('Connected Bloc');
    //   add(SocketServiceSetConnectionEvent(isConnected: true));
    // });
    // socketService.service.onDisconnect((payload) {
    //   print('Disconnected Bloc');
    //   add(SocketServiceSetConnectionEvent(isConnected: false));
    // });
    functionalSocket.eventStream.listen((event) {
      FunctionalSocketEventEnum eventEnum = event.functionalSocketEventEnum;
      switch (eventEnum) {
        case FunctionalSocketEventEnum.onConnected:
          print('Connected Bloc');
          add(SocketServiceSetConnectionEvent(isConnected: true));
          break;
        case FunctionalSocketEventEnum.onDisconected:
          print('Disconnected Bloc');
          add(SocketServiceSetConnectionEvent(isConnected: false));
          break;
        default:
      }
    });
  }
}
