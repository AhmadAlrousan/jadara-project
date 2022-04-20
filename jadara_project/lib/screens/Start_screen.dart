import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jadara_project/screens/Login_screen.dart';
import 'package:jadara_project/widgets/button.dart';

class Start_screen extends StatelessWidget {
  const Start_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical:15 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
               Image.network('https://lh3.googleusercontent.com/-hJgH-WPVFbo/YWV8302jFaI/AAAAAAAACYE/afLk_lCd60IYOTt7XSc31FiCd4k_5Tv4QCNcBGAsYHQ/ECC.jpg',),

              // ignore: deprecated_member_use

             Button(),
            ],
          ),
        ),
      ) ,
    );
  }
}
