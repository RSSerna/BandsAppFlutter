import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';

class ServerStatusWidget extends StatelessWidget {
  const ServerStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: BlocBuilder<SocketServiceBloc, SocketServiceBlocState>(
        builder: (context, state) {
          if (state is SocketConnectedState) {
            return const Icon(
              Icons.check_circle,
              color: Colors.green,
            );
          } else if (state is SocketDisconnectedState) {
            return const Icon(
              Icons.offline_bolt,
              color: Colors.red,
            );
          } else {
            return const Icon(
              Icons.reset_tv_rounded,
              color: Colors.yellow,
            );
          }
        },
      ),
    );
  }
}
