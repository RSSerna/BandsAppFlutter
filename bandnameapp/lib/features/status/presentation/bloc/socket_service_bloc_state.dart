part of 'socket_service_bloc.dart';

sealed class SocketServiceBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SocketInitialState extends SocketServiceBlocState {}

final class SocketReceivedDataState extends SocketServiceBlocState {
  final SocketEventEnum socketEventEnum;
  final dynamic payload;
  SocketReceivedDataState({required this.socketEventEnum, required this.payload});
  @override
  List<Object?> get props => [socketEventEnum, payload];
}