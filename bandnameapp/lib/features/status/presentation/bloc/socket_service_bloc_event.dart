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
  @override
  List<Object?> get props => [isConnected];
}
