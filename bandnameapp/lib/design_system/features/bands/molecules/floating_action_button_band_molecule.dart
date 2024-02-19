import 'dart:io';

import 'package:bandnameapp/design_system/features/shared/atom/alert_dialog_android_atom.dart';
import 'package:bandnameapp/design_system/features/shared/atom/alert_dialog_ios_atom.dart';
import 'package:bandnameapp/features/bands/presentation/bloc/bands_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bandnameapp/design_system/features/shared/atom/floating_action_button_atom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingActionButtonBandMolecule extends StatelessWidget {
  const FloatingActionButtonBandMolecule({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButtonAtom(
      onPressed: () => addNewBandWidget(context),
      child: const Icon(Icons.add),
    );
  }

  void addNewBandWidget(BuildContext context) {
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogAndroidAtom(
            title: const Text('New Band Name'),
            textController: textController,
            onPressed: () {
              addBandToList(context, textController.text);
            },
          );
        },
      );
    } else {
      showCupertinoDialog(
          context: context,
          builder: (_) {
            return AlertDialogIOsAtom(
              title: const Text('New Band Name'),
              textController: textController,
              onPressed: () {
                addBandToList(context, textController.text);
              },
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
