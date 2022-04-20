import 'package:flutter/material.dart';
import 'package:jadara_project/models/user.dart';

class User {
  final String firstName;
  final String lasttName;
  final String email;
  final String password;
  final String imageURL;
  final String id;
  final String phone;
  final String job;
  final String city;
  final bool sw;
  final List<User> speakers;
  final List<User> others;



  const User({
    required this.firstName,
    required this.lasttName,
    required this.email,
    required this.password,
    required this.imageURL,
    required this.id,
    required this.phone,
    required this.job,
    required this.city,
    required this.sw,
    this.speakers=const[],
    this.others=const[],



  } );
}
