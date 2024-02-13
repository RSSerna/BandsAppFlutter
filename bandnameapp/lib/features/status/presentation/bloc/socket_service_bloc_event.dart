part of 'socket_service_bloc.dart';

sealed class SocketServiceBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SocketServiceTryConnectEvent extends SocketServiceBlocEvent {}

class SocketServiceTryDisconnectEvent extends SocketServiceBlocEvent {}

class SocketServiceReceivedDataEvent extends SocketServiceBlocEvent {
  final SocketEventEnum socketEventEnum;
  final dynamic payload;
  SocketServiceReceivedDataEvent(
      {required this.socketEventEnum, required this.payload});

  @override
  List<Object?> get props => [socketEventEnum, payload];
}

class SocketServiceSetConnectionEvent extends SocketServiceBlocEvent {
  final bool isConnected;

  SocketServiceSetConnectionEvent({required this.isConnected});
  @override
  List<Object?> get props => [isConnected];
}

class SocketServiceSendEvent extends SocketServiceBlocEvent {
  final String event;
  final dynamic data;

  SocketServiceSendEvent({required this.event, required this.data});
  @override
  List<Object?> get props => [event, data];
}
