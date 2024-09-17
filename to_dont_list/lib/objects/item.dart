// Data class to keep the string and have an abbreviation function

import 'package:flutter/material.dart';

class Item {
  const Item({required this.name, required this.color});

  final String name;
  final Color color;

  String abbrev() {
    return name.substring(0, 1);
  }
}
