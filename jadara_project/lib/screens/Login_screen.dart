import 'package:flutter/material.dart';
import 'package:jadara_project/models/Login_Form.dart';


enum AuthTypelog{login }

class Login_Screen extends StatelessWidget {
  final AuthTypelog authTypelog;

  const Login_Screen({Key? key, required this.authTypelog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * .5,
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
                      height: 60,
                    ),
                    Text(
                      "Hello",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                    Center(
                      child: Image.network(
                        'https://cdn.dribbble.com/users/1889528/screenshots/7239609/media/9618c7e174ae3ddf8aed3322cb86008e.jpg?compress=1&resize=800x600',
                        height: 300,
                        width: 330,


                      ),
                    ),
                  ],
                )
              ],),

              LoginForm(authTypelog: authTypelog,),
            ],
          ),
        ));
  }
}
