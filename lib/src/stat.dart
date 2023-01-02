import 'package:flutter/material.dart';

class Stat{
  String name;
  Color? color;

  Stat({required this.name, this.color});

  @override
  String toString() {
    return name;
  }
}