import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlertDialogIOsAtom extends StatelessWidget {
  final TextEditingController textController;
  final void Function() onPressed;
  final Widget? title;
  const AlertDialogIOsAtom(
      {super.key,
      required this.textController,
      required this.onPressed,
      this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: title,
      content: TextField(
        controller: textController,
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: onPressed,
          child: Text(AppLocalizations.of(context)!.add),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: Text(AppLocalizations.of(context)!.cancel),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
// const Text('New Band Name')