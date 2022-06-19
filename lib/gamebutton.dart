import 'package:flutter/material.dart';

class GameButton {
  late int id;
  late Color clr;
  late bool enabled;
  late String str;
  GameButton(this.id) {
    clr = Colors.black26;
    enabled = true;
    str = '';
  }
}
