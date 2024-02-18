// ignore_for_file: avoid_print
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bandnameapp/core/enums/socket_enums.dart';
import 'package:bandnameapp/core/sockets/socket.dart';
// import 'package:bandnameapp/core/sockets/socket_client_io.dart';

part 'socket_service_bloc_event.dart';
part 'socket_service_bloc_state.dart';

enum ServerStatus { online, offline, connecting }

class SocketServiceBloc
    extends Bloc<SocketServiceBlocEvent, SocketServiceBlocState> {
  final SocketService socketService;

  ServerStatus _serverStatus = ServerStatus.connecting;
  ServerStatus get serverStatus => _serverStatus;

  SocketServiceBloc({required this.socketService})
      : super(SocketInitialState()) {
    _initSocketConfig();
    print('SocketServiceBLoC Created');

    on<SocketServiceSetConnectionEvent>((event, emit) {
      _serverStatus =
          event.isConnected ? ServerStatus.online : ServerStatus.offline;
      emit(state);
    });
  }

  void _initSocketConfig() {
    // SocketClientIO().service.onConnect((payload) {
    //   add(SocketServiceSetConnectionEvent(isConnected: true));
    // });
    // SocketClientIO().service.onDisconnect((payload) {
    //   add(SocketServiceSetConnectionEvent(isConnected: false));
    // });
    socketService.service.onConnect((payload) {
      add(SocketServiceSetConnectionEvent(isConnected: true));
    });
    socketService.service.onDisconnect((payload) {
      add(SocketServiceSetConnectionEvent(isConnected: false));
    });
  }
}
