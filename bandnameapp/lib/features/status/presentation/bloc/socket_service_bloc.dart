// ignore_for_file: avoid_print

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

part 'socket_service_bloc_event.dart';
part 'socket_service_bloc_state.dart';

class SocketServiceBloc
    extends Bloc<SocketServiceBlocEvent, SocketServiceBlocState> {
  late io.Socket _socket;

  SocketServiceBloc() : super(SocketConnectingState()) {
    _initConfing();
    on<SocketServiceSetConnectionEvent>((event, emit) {
      emit(event.isConnected
          ? SocketConnectedState()
          : SocketDisconnectedState());
    });
    on<SocketServiceSendEvent>((event, emit) {
      _socket.emit(event.event, event.data);
    });
  }

  void _initConfing() {
    print('SocketServiceBloc Initialized');

    final opts = io.OptionBuilder()
        .setTransports(['websocket']) // for Flutter or Dart VM
        .build();
    print(opts);
    _socket = io.io('http://10.0.2.2:3000/', opts);

    print(_socket.connected);

    _socket.onConnect((_) {
      add(SocketServiceSetConnectionEvent(isConnected: true));
      print('connect');
    });
    _socket.onDisconnect((_) {
      add(SocketServiceSetConnectionEvent(isConnected: false));
      print('disconnect');
    });
    _socket.on('nuevo-mensaje', (payload) {
      print('NuevoMensaje $payload');
    });
  }
}
