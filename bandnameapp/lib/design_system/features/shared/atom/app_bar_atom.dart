import 'package:flutter/material.dart';

class AppBarAtom {
  static AppBar getAppBarAtom({Widget? title, List<Widget>? actions}) {
    return AppBar(title: title, actions: actions,);
  }
}
