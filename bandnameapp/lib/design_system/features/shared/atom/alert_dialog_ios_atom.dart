import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: const Text('Local: Add'),
        ),
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text('Local: Cancel'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
// const Text('New Band Name')