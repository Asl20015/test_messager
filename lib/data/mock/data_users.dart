import 'package:flutter/material.dart';
import 'package:test_messager/data/models/user.dart';

class DataUsers {
  final users = [
    User(
      id: 1,
      name: 'Виктор Власов',
      lastOnline: DateTime.now(),
      colors: [
        const Color(0xff1FDB5F),
        const Color(0xff31C764),
      ],
    ),
    User(
      id: 2,
      name: 'Саша Алексеев',
      lastOnline: DateTime.now().add(const Duration(minutes: -5)),
      colors: [
        const Color(0xffF66700),
        const Color(0xffED3900),
      ],
    ),
    User(
      id: 3,
      name: 'Пётр Жаринов',
      lastOnline: DateTime.now().add(const Duration(days: -1)),
      colors: [
        const Color(0xff00ACF6),
        const Color(0xff006DED),
      ],
    ),
    User(
      id: 4,
      name: 'Алина Жукова',
      lastOnline: DateTime.now().add(const Duration(days: -5)),
      colors: [
        const Color(0xffF66700),
        const Color(0xffED3900),
      ],
    ),
  ];
}
