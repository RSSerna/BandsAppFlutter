import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'package:bandnameapp/core/sockets/socket.dart';
// import 'package:bandnameapp/core/sockets/socket_client_io.dart';
import 'package:bandnameapp/core/enums/socket_enums.dart';
import 'package:bandnameapp/core/functionalSocket/functional_socket.dart';
import 'package:bandnameapp/features/bands/domain/usecases/add_band.dart';
import 'package:bandnameapp/features/bands/domain/usecases/delete_band.dart';
import 'package:bandnameapp/features/bands/domain/usecases/vote_band.dart';
import 'package:bandnameapp/features/bands/data/models/bands_model.dart';

part 'bands_event.dart';
part 'bands_state.dart';

class BandsBloc extends Bloc<BandsEvent, BandsState> {
  List<BandsModel> bands = [];
  final AddBand addBand;
  final DeleteBand deleteBand;
  final VoteBand voteBand;
  final SocketService<Socket> socketService;
  final FunctionalSocket functionalSocket;

  BandsBloc(
      {required this.addBand,
      required this.deleteBand,
      required this.voteBand,
      required this.functionalSocket,
      required this.socketService})
      : super(BandsInitialState()) {
    _setUpSocketForBandsBloc();
    on<BandSendVoteEvent>((event, emit) {
      // SocketClientIO().sendData('vote-band', {'id': event.bandId});
      functionalSocket.sendData('vote-band', {'id': event.bandId});
      emit(BandsReloadState());
    });
    on<BandAddEvent>((event, emit) {
      // SocketClientIO().sendData('add-band', {'name': event.bandName});
      functionalSocket.sendData('add-band', {'name': event.bandName});
      emit(BandsReloadState());
    });
    on<BandDeleteEvent>((event, emit) {
      // SocketClientIO().sendData('delete-band', {'id': event.bandId});
      functionalSocket.sendData('delete-band', {'id': event.bandId});
      emit(BandsReloadState());
    });

    on<BandsRetrieveEvent>((event, emit) {
      if (event.eventEnum == SocketEventEnum.receivedBands) {
        // List<BandsModel> newBands = [];
        // for (var band in event.payload) {
        //   newBands.add(BandsModel.fromMap(band));
        // }
        // bands = newBands;
        bands = (event.payload)
            .map(
              (band) => BandsModel.fromMap(band),
            )
            .toList();
        emit(BandsReloadState());
      }
    });
  }
  void _setUpSocketForBandsBloc() {
    // SocketClientIO().service.on('active-bands', (payload) {
    //   print(payload);
    //   add(BandsRetrieveEvent(
    //       eventEnum: SocketEventEnum.receivedBands, payload: payload));
    // });
    // socketService.service.on('active-bands', (payload) {
    //   print(payload);
    //   add(BandsRetrieveEvent(
    //       eventEnum: SocketEventEnum.receivedBands, payload: payload));
    // });
    functionalSocket.eventStream.listen((event) {
      FunctionalSocketEventEnum eventEnum = event.functionalSocketEventEnum;
      switch (eventEnum) {
        case FunctionalSocketEventEnum.activeBands:
          add(BandsRetrieveEvent(
              eventEnum: SocketEventEnum.receivedBands, payload: event.data));
          break;
        default:
      }
    });
  }
}
