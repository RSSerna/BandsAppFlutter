import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';
import 'package:bandnameapp/design_system/features/shared/atom/app_bar_atom.dart';
import 'package:bandnameapp/design_system/features/status/atoms/status_connected_icon_atom.dart';
import 'package:bandnameapp/design_system/features/status/atoms/status_connecting_icon_atom.dart';
import 'package:bandnameapp/design_system/features/status/atoms/status_disconnected_icon_atom.dart';

// class AppBarWithSocketStatusMolecule {
//   static AppBar getAppBarWithSocketStatusMolecule(Widget? title) {
//     return AppBarAtom(title: title, actions: [
//       Container(
//         margin: const EdgeInsets.only(right: 10),
//         child: BlocBuilder<SocketServiceBloc, SocketServiceBlocState>(
//           builder: (context, state) {
//             if (state is SocketConnectedState) {
//               return const StatusConnectedIconAtom();
//             } else if (state is SocketDisconnectedState) {
//               return const StatusDisconnectedIconAtom();
//             } else {
//               return const StatusConnectingIconAtom();
//             }
//           },
//         ),
//       )
//     ]);
//   }
// }
class AppBarWithSocketStatusMolecule extends AppBarAtom {
  AppBarWithSocketStatusMolecule({super.key, super.title})
      : super(actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: BlocBuilder<SocketServiceBloc, SocketServiceBlocState>(
                builder: (context, state) {
                  if (state is SocketConnectedState) {
                    return const StatusConnectedIconAtom();
                  } else if (state is SocketDisconnectedState) {
                    return const StatusDisconnectedIconAtom();
                  } else {
                    return const StatusConnectingIconAtom();
                  }
                },
              ))
        ]);

}
