import 'dart:io';
import 'package:bandnameapp/features/status/presentation/widgets/server_status_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bandnameapp/features/bands/presentation/screens/bloc/bands_bloc.dart';
import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';
import 'package:bandnameapp/features/bands/data/models/bands_model.dart';

class BandsScreen extends StatefulWidget {
  BandsScreen({super.key});

  @override
  State<BandsScreen> createState() => _BandsScreenState();
}

class _BandsScreenState extends State<BandsScreen> {
  late List<BandsModel> bands = const [
    BandsModel(id: '1', name: 'Metallica', votes: 1),
    BandsModel(id: '2', name: 'Queen', votes: 4),
    BandsModel(id: '3', name: 'Linkin Park', votes: 2),
    BandsModel(id: '4', name: 'GunsNRoses', votes: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Band Names'),
        actions: const [
          ServerStatusWidget()
        ],
      ),
      body: BlocListener<SocketServiceBloc, SocketServiceBlocState>(
        listener: (context, state) {
          if (state is SocketReceivedDataState) {
            BlocProvider.of<BandsBloc>(context, listen: false).add(
                BandsRetrieveEvent(
                    payload: state.payload, eventEnum: state.socketEventEnum));
          }
        },
        child: BlocBuilder<BandsBloc, BandsState>(
          builder: (context, state) {
            bands = BlocProvider.of<BandsBloc>(context, listen: false).bands;
            return ListView.builder(
              itemCount: bands.length,
              itemBuilder: (BuildContext context, int index) {
                return _bandTile(bands[index]);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewBandWidget(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(BandsModel band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        print('direction: $direction');
        print('id: ${band.id}');
        // TODO: llamar el borrado en el server
      },
      background: Container(
          padding: const EdgeInsets.only(left: 8.0),
          color: Colors.red,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text('Delete Band', style: TextStyle(color: Colors.white)),
          )),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0, 2)),
        ),
        title: Text(band.name),
        trailing: Text('${band.votes}', style: const TextStyle(fontSize: 20)),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  void addNewBandWidget(BuildContext context) {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog.adaptive(
            title: const Text('New Band Name'),
            content: TextField(
              controller: textController,
            ),
            actions: [
              MaterialButton(
                child: const Text('Add'),
                onPressed: () {
                  addBandToList(context, textController.text);
                },
              )
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
          context: context,
          builder: (_) {
            return CupertinoAlertDialog(
              title: const Text('New Band Name'),
              content: TextField(
                controller: textController,
              ),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: const Text('Add'),
                  onPressed: () {
                    addBandToList(context, textController.text);
                  },
                ),
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  child: const Text('Add'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            );
          });
    }
  }

  void addBandToList(BuildContext context, String bandName) {
    print(bandName);

    if (bandName.isEmpty) {
      return;
    }
    bands.add(
        BandsModel(id: DateTime.now().toString(), name: bandName, votes: 0));

    setState(() {});
    Navigator.pop(context);
  }
}

