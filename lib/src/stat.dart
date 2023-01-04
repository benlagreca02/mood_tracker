import 'package:flutter/material.dart';

class Stat{
  String name;
  Color? color;

  Stat({required this.name, this.color});

  // two stats are equal if they have the same name
  @override
  bool operator ==(Object other) =>
      other is Stat &&
      other.runtimeType == runtimeType &&
      other.name == name;

  @override
  String toString() {
    return name;
  }

  @override
  // just hash the string name
  // we don't care about anything but name
  int get hashCode => name.hashCode;

}