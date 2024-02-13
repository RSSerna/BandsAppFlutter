import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bandnameapp/features/bands/data/models/bands_model.dart';
import 'package:bandnameapp/features/bands/presentation/screens/bloc/bands_bloc.dart';
import 'package:bandnameapp/features/status/presentation/widgets/server_status_widget.dart';
import 'package:pie_chart/pie_chart.dart';

class BandsScreen extends StatelessWidget {
// class BandsScreen extends StatefulWidget {
//   BandsScreen({super.key});

//   @override
//   State<BandsScreen> createState() => _BandsScreenState();
// }

// class _BandsScreenState extends State<BandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Band Names'),
        actions: const [ServerStatusWidget()],
      ),
      body: BlocBuilder<BandsBloc, BandsState>(
        builder: (context, state) {
          List<BandsModel> bands =
              BlocProvider.of<BandsBloc>(context, listen: false).bands;
          print('reloaded');
          return Column(
            children: [
              _pieGraphForBands(
                allBands: bands,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: bands.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _bandTile(context, bands[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
      // Builder(
      //   builder: (context) {
      //     bands = BlocProvider.of<BandsBloc>(context).bands;
      //     return ListView.builder(
      //       itemCount: bands.length,
      //       itemBuilder: (BuildContext context, int index) {
      //         return _bandTile(bands[index]);
      //       },
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewBandWidget(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(BuildContext context, BandsModel band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        BlocProvider.of<BandsBloc>(context)
            .add(BandDeleteEvent(bandId: band.id));
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
          BlocProvider.of<BandsBloc>(context)
              .add(BandSendVoteEvent(bandId: band.id));
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
    BlocProvider.of<BandsBloc>(context).add(BandAddEvent(bandName: bandName));
    Navigator.pop(context);
  }
}

// ignore: camel_case_types, must_be_immutable
class _pieGraphForBands extends StatelessWidget {
  final List<BandsModel> allBands;
  _pieGraphForBands({
    required this.allBands,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {};
    for (var band in allBands) {
      dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
    }
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: PieChart(
        dataMap: dataMap,
        chartType: ChartType.ring,
        chartRadius: 150,
        chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true, decimalPlaces: 0),
      ),
    );
  }
}
