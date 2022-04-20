import 'package:flutter/material.dart';
import 'package:jadara_project/models/room.dart';
import 'package:jadara_project/models/user.dart';

 User currentUser = User(
    firstName: "sara",
    lasttName: "omar",
    email: "saraoar@gmail.com",
    password: "123",
    imageURL: "https://images.pexels.com/photos/6624474/pexels-photo-6624474.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    id: "1",
    phone: "07566447",
    job: "baby sitter",
    city: "irbid",
    sw: false,

);



final List<User>allUser=[
User(
    firstName: "maram",
    lasttName: "ali",
    email: "moal@gmail.com",
    password: "123",
    imageURL: "https://images.pexels.com/photos/3995912/pexels-photo-3995912.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    id: "2",
    phone: "07756456",
    job: "baby sitter",
    city: "irbid",
    sw: true

),
User(firstName: "sama",
lasttName: "alrousa",
email: "ahamdrousan@gmail.com",
password: "123",
imageURL: "https://images.pexels.com/photos/6624481/pexels-photo-6624481.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    id: "3",
    phone: "077",
    job: "baby sitter",
    city: "irbid",
    sw: true

),
User(firstName: "samera",
lasttName: "ali",
email: "ahamdrousan@gmail.com",
password: "123",
imageURL: "https://images.pexels.com/photos/3875229/pexels-photo-3875229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    id: "4",
    phone: "077",
    job: "baby sitter",
    city: "irbid",
    sw: true

),
User(firstName: "wedad",
lasttName: "karam",
email: "ahamdrousan@gmail.com",
password: "123",
imageURL: "https://images.pexels.com/photos/6209282/pexels-photo-6209282.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    id: "5",
    phone: "077",
    job: "baby sitter",
    city: "irbid",
    sw: true

),
User(firstName: "sara",
lasttName: "ahmad",
email: "ahamdrousan@gmail.com",
password: "123",
imageURL: "https://images.pexels.com/photos/7499573/pexels-photo-7499573.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    id: "6",
    phone: "077",
    job: "baby sitter",
    city: "irbid",
    sw: true

),
User(firstName: "rema",
lasttName: "alrousa",
email: "ahamdrousan@gmail.com",
password: "123",
imageURL: "https://images.pexels.com/photos/3795912/pexels-photo-3795912.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  id: "7",
  phone: "077",
    job: "baby sitter",
    city: "irbid",
    sw: true

),
User(firstName: "frah",
lasttName: "alrousa",
email: "ahamdrousan@gmail.com",
password: "123",
imageURL: "https://images.pexels.com/photos/9832699/pexels-photo-9832699.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    id: "8",
    phone: "077",
    job: "baby sitter",
    city: "irbid",
    sw: true


),
];




final List<Room> roomList= [
  Room(name: "جليسات اطفال",
      image: "https://images.pexels.com/photos/7282247/pexels-photo-7282247.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      // speakers:(List<User>.from(allUser)..shuffle()).getRange(0, 5).toList(),
      // others:(List<User>.from(allUser)..shuffle()),

  ),
  Room(name: " كبار السن",
    image: "https://images.pexels.com/photos/7551681/pexels-photo-7551681.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    // speakers:(List<User>.from(allUser)..shuffle()).getRange(0, 5).toList(),
    // others:(List<User>.from(allUser)..shuffle()),

  ),

];