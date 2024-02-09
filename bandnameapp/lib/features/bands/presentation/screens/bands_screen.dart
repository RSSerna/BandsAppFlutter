import 'dart:io';

import 'package:bandnameapp/features/status/presentation/bloc/socket_service_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bandnameapp/features/bands/data/models/bands_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BandsScreen extends StatefulWidget {
  BandsScreen({super.key});

  @override
  State<BandsScreen> createState() => _BandsScreenState();
}

class _BandsScreenState extends State<BandsScreen> {
  List<BandsModel> bands = const [
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
        actions: [
          Container(
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
                }
                else {
                  return const Icon(
                    Icons.reset_tv_rounded,
                    color: Colors.yellow,
                  );
                }
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) {
          return _bandTile(bands[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewBand(context);
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

  void addNewBand(BuildContext context) {
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
