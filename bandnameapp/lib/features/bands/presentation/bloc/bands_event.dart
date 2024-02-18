part of 'bands_bloc.dart';

sealed class BandsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BandSendVoteEvent extends BandsEvent {
  final String bandId;
  BandSendVoteEvent({
    required this.bandId,
  });
  @override
  List<Object?> get props => [bandId];
}
class BandDeleteEvent extends BandsEvent {
  final String bandId;
  BandDeleteEvent({
    required this.bandId,
  });
  @override
  List<Object?> get props => [bandId];
}

class BandAddEvent extends BandsEvent {
  final String bandName;
  BandAddEvent({
    required this.bandName,
  });
  @override
  List<Object?> get props => [bandName];
}

class BandsRetrieveEvent extends BandsEvent {
  final List<dynamic> payload;
  final SocketEventEnum eventEnum;

  BandsRetrieveEvent({required this.payload, required this.eventEnum});
  @override
  List<Object?> get props => [payload, eventEnum];
}
