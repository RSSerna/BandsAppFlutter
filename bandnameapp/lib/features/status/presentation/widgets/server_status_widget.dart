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
        child: Builder(
          builder: (context) {
            final socketServiceBloc =
                BlocProvider.of<SocketServiceBloc>(context, listen: true);
            if (socketServiceBloc.serverStatus == ServerStatus.online) {
              return const Icon(
                Icons.check_circle,
                color: Colors.green,
              );
            } else if (socketServiceBloc.serverStatus == ServerStatus.offline) {
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
        )

        //     BlocBuilder<SocketServiceBloc, SocketServiceBlocState>(
        //   builder: (context, state) {
        //     final socketServiceBloc =
        //         BlocProvider.of<SocketServiceBloc>(context, listen: false);
        //     if (socketServiceBloc.serverStatus == ServerStatus.online) {
        //       return const Icon(
        //         Icons.check_circle,
        //         color: Colors.green,
        //       );
        //     } else if (socketServiceBloc.serverStatus ==
        //         ServerStatus.offline) {
        //       return const Icon(
        //         Icons.offline_bolt,
        //         color: Colors.red,
        //       );
        //     } else {
        //       return const Icon(
        //         Icons.reset_tv_rounded,
        //         color: Colors.yellow,
        //       );
        //     }
        //   },
        // ),
        );
  }
}
