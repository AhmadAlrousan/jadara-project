import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jadara_project/models/SingUp_Form.dart';

enum AuthType{ singup}

class SingUp extends StatelessWidget {
  final AuthType authType;

  const SingUp({Key? key, required this.authType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:<Widget> [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * .16 ,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),

              Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Text(
                      "Sing Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                  )
                ],
              )
            ],),
            SingUpForm(authType: authType,),

          ],
        ) ,
      ) ,
    );
  }
}
