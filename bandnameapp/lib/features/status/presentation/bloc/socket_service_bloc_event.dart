part of 'socket_service_bloc.dart';

sealed class SocketServiceBlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SocketServiceTryConnectEvent extends SocketServiceBlocEvent {}

class SocketServiceTryDisconnectEvent extends SocketServiceBlocEvent {}

class SocketServiceSetConnectionEvent extends SocketServiceBlocEvent {
  final bool isConnected;

  SocketServiceSetConnectionEvent({required this.isConnected});
}

class SocketServiceSendEvent extends SocketServiceBlocEvent {
  final String event;
  final dynamic data;

  SocketServiceSendEvent({required this.event, required this.data});
}
