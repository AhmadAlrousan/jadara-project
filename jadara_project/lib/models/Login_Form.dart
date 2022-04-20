import 'package:flutter/material.dart';
import 'package:jadara_project/models/Statics.dart';
import 'package:jadara_project/screens/Login_screen.dart';
import 'package:jadara_project/services/auth.dart';
import 'package:jadara_project/services/dataase_baby.dart';
import 'package:jadara_project/services/database_Users.dart';
import 'package:jadara_project/services/database_lite.dart';
import 'package:jadara_project/widgets/button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer';


// import 'package:cloud_firestore/cloud_firestore.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'@')
        .hasMatch(this);
  }
}

class LoginForm extends StatefulWidget {
  final AuthTypelog authTypelog;
  // final Baby baby;
  const LoginForm({Key? key, required this.authTypelog, }) : super(key: key);


  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey=GlobalKey<FormState>();
  String _email="", _password="";
  MyDatabase myDatabase=MyDatabase();

  void showLongToast() {
    Fluttertoast.showToast(
      msg: "Invalid Login Credi.....",
      toastLength: Toast.LENGTH_LONG,
    );
  }
  void userslist() {
    var x=myDatabase.list_user();
    print(x);
  }

  AuthBase authBase=AuthBase();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 90),
            child: Column(
              children: [
                SizedBox(height: 16,),
                TextFormField(
                  controller: emailController,
                  onChanged: (value)=>_email=value,
                  validator: (value) => value!.isEmpty ? 'Enter a valid email' : value.isValidEmail() ? null : "Enter a valid email" ,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    hintText: 'ex : test@gmail.com',
                  ),
                ),
                SizedBox(height: 13,),
                TextFormField(
                  controller: passController,
                  onChanged: (value)=>_password=value,

                  validator: (value) => value!.length<6 ? ' your password must e lager than 6 characters' : null,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',

                  ),
                  obscureText: true,
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.teal,
                      onPressed: () async {
                         if(_formKey.currentState!.validate()) {
                           if (widget.authTypelog == AuthTypelog.login) {
                             var val1 = await  myDatabase.sp_loginU(emailController.text, passController.text);
                             var val2 = await  myDatabase.sp_loginB(emailController.text, passController.text);
                             var val3 = await  myDatabase.sp_loginE(emailController.text, passController.text);
                             print("............. " + val1.toString());
                             print("............. " + val2.toString());
                             print("............. " + val3.toString());

                             if (val1 == 0 && val2 ==0 &&val3==0) {
                               //show invalid login message

                               await showLongToast;
                               return;
                             } else {
                               if(val1==1)
                                 PREFS.TYPE="U" ;

                               else if (val2==1)
                                 PREFS.TYPE="B" ;

                               else if (val3==1)
                                 PREFS.TYPE="E" ;

                               PREFS.USER = emailController.text;
                               Navigator.of(context).pushReplacementNamed(
                                   'home2');
                             }
                           }
                         }
                         // userslist();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Text(widget.authTypelog == AuthTypelog.login ? 'login':'login',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),

                FlatButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacementNamed('singup');
                  },
                  child: Text("don't have an account ?",style: TextStyle(color: Colors.teal,fontSize: 18),),

                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

