import 'package:get_it/get_it.dart';
import 'package:bandnameapp/core/sockets/socket.dart';
import 'package:bandnameapp/core/sockets/socket_client_io.dart';
import 'package:bandnameapp/features/bands/data/datasources/bands_remote_data_source.dart';
import 'package:bandnameapp/features/bands/data/repositories/bands_repository_impl.dart';
import 'package:bandnameapp/features/bands/domain/repositories/bands_repository.dart';
import 'package:bandnameapp/features/bands/domain/usecases/add_band.dart';
import 'package:bandnameapp/features/bands/domain/usecases/delete_band.dart';
import 'package:bandnameapp/features/bands/domain/usecases/vote_band.dart';
import 'package:bandnameapp/features/bands/presentation/bloc/bands_bloc.dart';
import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class InjectionContainer {
  Future<void> init();
}

class InjectionContainerImpl implements InjectionContainer {
  final sl = GetIt.instance;

  @override
  Future<void> init() async {
    //Socket Service
    sl.registerSingleton<SocketService<Socket>>(SocketClientIO());
    ///Features
    ///Socket Service Bloc
    sl.registerSingleton<SocketServiceBloc>(SocketServiceBloc(socketService: sl()));
    //Bands Bloc
    sl.registerFactory(() => BandsBloc(
        addBand: sl(), deleteBand: sl(), voteBand: sl(), socketService: sl()));
    //Usecase
    sl.registerLazySingleton(() => AddBand(repository: sl()));
    sl.registerLazySingleton(() => DeleteBand(repository: sl()));
    sl.registerLazySingleton(() => VoteBand(repository: sl()));
    //Repository
    sl.registerLazySingleton<BandsRepository>(
      () => BandsRepositoryImpl(bandsRemoteDataSource: sl()),
    );
    //Data
    sl.registerLazySingleton<BandsRemoteDataSource>(
      () => BandsRemoteDataSourceImpl(socketService: sl()),
    );
  }
}
