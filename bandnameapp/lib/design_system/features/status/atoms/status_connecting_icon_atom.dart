import 'package:flutter/material.dart';

class StatusConnectingIconAtom extends StatelessWidget {
  const StatusConnectingIconAtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.reset_tv_rounded,
      color: Colors.yellow,
    );
  }
}