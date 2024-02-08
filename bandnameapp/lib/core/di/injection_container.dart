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

    ///Socket Service
    sl.registerFactory(() => SocketServiceBloc());
  }
}
