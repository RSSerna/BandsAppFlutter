part of 'socket_service_bloc.dart';

sealed class SocketServiceBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class SocketConnectedState extends SocketServiceBlocState {}
final class SocketDisconnectedState extends SocketServiceBlocState {}