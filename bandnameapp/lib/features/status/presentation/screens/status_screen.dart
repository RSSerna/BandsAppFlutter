// import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class StatusScreen extends StatelessWidget {
//   const StatusScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: BlocBuilder<SocketServiceBloc, SocketServiceBlocState>(
//           builder: (context, state) {
//             return Text(state.toString());
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.message),
//         onPressed: () {
//           BlocProvider.of<SocketServiceBloc>(context, listen: false).add(
//               SocketServiceSendEvent(event: 'emitir-mensaje', data: const {
//             'nombre': 'Flutter',
//             'mensaje': 'Hola desde FLutter'
//           }));
//         },
//       ),
//     );
//   }
// }
