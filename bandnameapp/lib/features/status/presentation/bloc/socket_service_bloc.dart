// ignore_for_file: avoid_print
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bandnameapp/core/enums/socket_enums.dart';
import 'package:bandnameapp/core/sockets/socket.dart';
import 'package:bandnameapp/core/sockets/socket_client_io.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'socket_service_bloc_event.dart';
part 'socket_service_bloc_state.dart';

enum ServerStatus { online, offline, connecting }

class SocketServiceBloc
    extends Bloc<SocketServiceBlocEvent, SocketServiceBlocState> {
  // late io.Socket _socket;
  final SocketService service;

  ServerStatus _serverStatus = ServerStatus.connecting;
  ServerStatus get serverStatus => _serverStatus;

  SocketServiceBloc({required this.service}) : super(SocketInitialState()) {
    _initSocketConfig();
    print('SocketServiceBLoC Created');

    on<SocketServiceSetConnectionEvent>((event, emit) {
      _serverStatus =
          event.isConnected ? ServerStatus.online : ServerStatus.offline;
      emit(state);
    });

    on<SocketServiceReceivedDataEvent>((event, emit) {
      emit(SocketReceivedDataState(
          socketEventEnum: event.socketEventEnum, payload: event.payload));
    });

    on<SocketServiceSendEvent>((event, emit) {
      service.sendData(event.event, event.data);
      // _socket.emit(event.event, event.data);
    });
  }

  void _initSocketConfig() {
    SocketClientIO().socket.on('active-bands', (payload) {
      print('Hi from BloC payload:');
      print(payload);
      add(SocketServiceReceivedDataEvent(
          socketEventEnum: SocketEventEnum.receivedBands, payload: payload));
    });

    SocketClientIO().socket.onConnect((payload) {
      add(SocketServiceSetConnectionEvent(isConnected: true));
    });
  }

  // void _initConfing() {
  //   print('SocketServiceBloc Initialized');

  //   final opts = io.OptionBuilder()
  //       .setTransports(['websocket']) // for Flutter or Dart VM
  //       .build();
  //   print(opts);
  //   _socket = io.io('http://10.0.2.2:3000/', opts);

  //   print(_socket.connected);

  //   _socket.onConnect((_) {
  //     add(SocketServiceSetConnectionEvent(isConnected: true));
  //     print('connect');
  //   });

  //   _socket.onDisconnect((_) {
  //     add(SocketServiceSetConnectionEvent(isConnected: false));
  //     print('disconnect');
  //   });
  //   _socket.on('nuevo-mensaje', (payload) {
  //     print('NuevoMensaje $payload');
  //   });

  //   _socket.on('active-bands', (payload) {
  //     add(SocketServiceReceivedDataEvent(
  //         socketEventEnum: SocketEventEnum.receivedBands, payload: payload));
  //     print('NuevoMensaje $payload');
  //   });
  // }
}
