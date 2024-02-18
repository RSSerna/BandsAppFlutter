part of 'bands_bloc.dart';

sealed class BandsState {}

interface class BandsStateWithEquatable extends Equatable {
  @override
  List<Object?> get props => [];
}

final class BandsInitialState extends BandsState
    implements BandsStateWithEquatable {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => null;
}

final class BandsReloadState extends BandsState {}
