part of 'socket_service_bloc.dart';

sealed class SocketServiceBlocState {}

final class SocketConnectingState extends SocketServiceBlocState {}

final class SocketConnectedState extends SocketServiceBlocState {}

final class SocketDisconnectedState extends SocketServiceBlocState {}
