import 'package:bandnameapp/core/sockets/socket_client_io.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bandnameapp/core/enums/socket_enums.dart';
import 'package:bandnameapp/features/bands/data/models/bands_model.dart';

part 'bands_event.dart';
part 'bands_state.dart';

class BandsBloc extends Bloc<BandsEvent, BandsState> {
  // late StreamSubscription socketServiceStreamSubscription;
  List<BandsModel> bands = [];

  BandsBloc() : super(BandsInitialState()) {
    on<BandSendVoteEvent>((event, emit) {
      SocketClientIO().sendData('vote-band', {'id': event.bandId});
      emit(BandsReloadState());
    });
    on<BandAddEvent>((event, emit) {
      SocketClientIO().sendData('add-band', {'name': event.bandName});
      emit(BandsReloadState());
    });
    on<BandDeleteEvent>((event, emit) {
      SocketClientIO().sendData('delete-band', {'id': event.bandId});
      emit(BandsReloadState());
    });

    on<BandsRetrieveEvent>((event, emit) {
      if (event.eventEnum == SocketEventEnum.receivedBands) {
        // List<BandsModel> newBands = [];
        // for (var band in event.payload) {
        //   newBands.add(BandsModel.fromMap(band));
        // }
        // bands = newBands;
        bands = (event.payload as List)
            .map(
              (band) => BandsModel.fromMap(band),
            )
            .toList();
        emit(BandsReloadState());
      }
    });

    SocketClientIO().socket.on('active-bands', (payload) {
      print('Hi from BloC payload:');
      print(payload);
      add(BandsRetrieveEvent(
          eventEnum: SocketEventEnum.receivedBands, payload: payload));
    });
  }
}
