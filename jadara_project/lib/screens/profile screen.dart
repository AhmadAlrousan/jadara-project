import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jadara_project/data.dart';
import 'package:jadara_project/models/Statics.dart';
import 'package:jadara_project/services/database_lite.dart';
import 'package:jadara_project/widgets/user_profile_image.dart';

class switch1 extends StatefulWidget {
  const switch1({Key? key}) : super(key: key);

  @override
  Profile_Screen createState() => Profile_Screen(switch1);
}

class Profile_Screen extends State<switch1> {
  MyDatabase myDatabase=MyDatabase();
  bool isSwitched = false;

  Profile_Screen(Type switch1);






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Stack(children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .4,
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
                      height: 40,
                    ),
                    Center(
                      child: Padding(padding: const EdgeInsets.all(20.0),
                        child: userprofileimage(size: 150,
                          imageUrl: currentUser.imageURL,),),
                    ),
                    Text(PREFS.NAME,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Busy",style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                    ),
                    Switch(
                      value:isSwitched ,
                      onChanged: (value) {
                        setState(() {
                          isSwitched =  value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Colors.red,
                      activeColor: Colors.teal,
                    ),


                  ],
                )
              ],),
              Column(

                children: [

                  SizedBox(
                    height: 20,
                  ),
                  Text("Account info",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("FullName :",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(PREFS.NAME,
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Edit",
                          style: TextStyle(color: Colors.teal, fontSize: 12),),

                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("phone : ",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(PREFS.PHONE.toString(),
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Edit",
                          style: TextStyle(color: Colors.teal, fontSize: 12),),

                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("City :",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(PREFS.CITY,
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Edit",
                          style: TextStyle(color: Colors.teal, fontSize: 12),),

                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("Email :",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(PREFS.USER,
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Edit",
                          style: TextStyle(color: Colors.teal, fontSize: 12),),

                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("experience ",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: TextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(300),
                          ],
                          maxLines: null,
                          decoration: InputDecoration.collapsed(
                            hintText: "Enter your text here",
                            hintStyle: TextStyle(
                              color: Colors.teal, fontSize: 13,),),
                        ),
                      )
                  )

                ],
              )
            ]
        ),
      ),
    );
  }
}
