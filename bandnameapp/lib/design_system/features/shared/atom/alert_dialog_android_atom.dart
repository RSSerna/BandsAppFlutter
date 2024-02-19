import 'package:flutter/material.dart';

class AlertDialogAndroidAtom extends StatelessWidget {
  final TextEditingController textController;
  final void Function() onPressed;
  final Widget? title;
  const AlertDialogAndroidAtom(
      {super.key,
      required this.textController,
      required this.onPressed,
      this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: TextField(
        controller: textController,
      ),
      actions: [
        MaterialButton(
          onPressed: onPressed,
          child: const Text('Local: Add'),
        )
      ],
    );
  }
}
// () {
//             addBandToList(context, textController.text);
//           }
// const Text('New Band Name')