import 'package:flutter/material.dart';

class StatusDisconnectedIconAtom extends StatelessWidget {
  const StatusDisconnectedIconAtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.offline_bolt,
      color: Colors.red,
    );
  }
}