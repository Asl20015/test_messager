import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final DateTime lastOnline;
  final List<Color>? colors;

  User({
    required this.id,
    required this.name,
    required this.lastOnline,
    required this.colors,
  });

  String get lettersName => name.split(' ').map((e) => e[0]).join('').toUpperCase();
}
