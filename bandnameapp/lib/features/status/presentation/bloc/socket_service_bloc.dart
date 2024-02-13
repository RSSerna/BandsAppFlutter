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
      SocketClientIO().sendData(event.event, event.data);
    });
  }

  void _initSocketConfig() {
    SocketClientIO().socket.onConnect((payload) {
      add(SocketServiceSetConnectionEvent(isConnected: true));
    });
    SocketClientIO().socket.onDisconnect((payload) {
      add(SocketServiceSetConnectionEvent(isConnected: false));
    });
  }
}
