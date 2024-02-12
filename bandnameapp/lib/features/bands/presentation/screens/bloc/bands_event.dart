part of 'bands_bloc.dart';

sealed class BandsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BandsRetrieveBandsEvent extends BandsEvent {
  final List<BandsModel> bands;

  BandsRetrieveBandsEvent({required this.bands});
}

class BandsRetrieveEvent extends BandsEvent {
  final List<dynamic> payload;
  final SocketEventEnum eventEnum;

  BandsRetrieveEvent({required this.payload, required this.eventEnum});
}
