import 'package:flutter/material.dart';
import 'package:jadara_project/models/user.dart';


class Room {
  final String name;
  final String image;
  final List<User> speakers;
  final List<User> others;

  Room({
    required this.name,
    required this.image,
      this.speakers = const[],
      this.others = const[],
  });
}
