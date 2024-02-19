import 'package:flutter/material.dart';

class StatusConnectedIconAtom extends StatelessWidget {
  const StatusConnectedIconAtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check_circle,
      color: Colors.green,
    );
  }
}