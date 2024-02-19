import 'package:flutter/material.dart';

class FloatingActionButtonAtom extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const FloatingActionButtonAtom({super.key, this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
