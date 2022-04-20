import 'package:flutter/material.dart';

import '../data.dart';

class userprofileimage extends StatelessWidget {
  final String imageUrl;
  final double size;



  const userprofileimage({
    Key? key,
   required this.imageUrl,
  required  this.size,

  }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Image.network(
       imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),

    );
  }
}
