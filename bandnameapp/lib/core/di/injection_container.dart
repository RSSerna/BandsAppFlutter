import 'package:bandnameapp/core/sockets/socket.dart';
import 'package:bandnameapp/core/sockets/socket_client_io.dart';
import 'package:bandnameapp/features/bands/presentation/screens/bloc/bands_bloc.dart';
import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class InjectionContainer {
  Future<void> init();
}

class InjectionContainerImpl implements InjectionContainer {
  final sl = GetIt.instance;

  @override
  Future<void> init() async {
    ///Features

    ///Socket Service Bloc
    sl.registerFactory(() => SocketServiceBloc(service: sl()));
    //Bands Bloc
    // sl.registerFactory(
    //     () => BandsBloc(socketServiceBloc: sl<SocketServiceBloc>()));
    sl.registerFactory(() => BandsBloc());
    //Socket Service
    sl.registerSingleton<SocketService>(SocketClientIO());

    // sl.registerLazySingleton<SocketService>(
    //   () => SocketClientIO(serviceBloc: sl()),
    // );

    // sl<SocketService>()
  }
}
