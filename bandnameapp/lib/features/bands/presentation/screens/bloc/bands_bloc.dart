import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bandnameapp/core/enums/socket_enums.dart';
import 'package:bandnameapp/features/bands/data/models/bands_model.dart';
import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';

part 'bands_event.dart';
part 'bands_state.dart';

class BandsBloc extends Bloc<BandsEvent, BandsState> {
  late SocketServiceBloc socketServiceBloc;
  // final SocketServiceBloc socketServiceBloc =
  //     InjectionContainerImpl().sl<SocketServiceBloc>();
  // late StreamSubscription socketServiceStreamSubscription;
  List<BandsModel> bands = [];

  // BandsBloc({required this.socketServiceBloc}) : super(BandsInitial()) {
  BandsBloc() : super(BandsInitial()) {
    on<BandsEvent>((event, emit) {});
    on<BandsRetrieveBandsEvent>((event, emit) {
      // bands = event.bands;
      emit(state);
    });
    on<BandsRetrieveEvent>((event, emit) {
      if (event.eventEnum == SocketEventEnum.receivedBands) {
        List<BandsModel> newBands = [];
        for (var band in event.payload) {
          newBands.add(BandsModel.fromMap(band));
        }
        bands = (event.payload as List)
            .map(
              (band) => BandsModel.fromMap(band),
            )
            .toList();
        add(BandsRetrieveBandsEvent(bands: newBands));
      }
    });
  }
  void monitorSocketService() {
    // socketServiceStreamSubscription =
    //     socketServiceBloc.stream.listen((socketServiceState) {
    //   if (socketServiceState is SocketReceivedDataState) {
    //     if (socketServiceState.socketEventEnum ==
    //         SocketEventEnum.receivedBands) {
    //       add(BandsRetrieveBandsEvent(bands: socketServiceState.payload));
    //     }
    //   }
    // });
  }

  setSocketServiceBloc(SocketServiceBloc serviceBloc) =>
      socketServiceBloc = serviceBloc;
}
