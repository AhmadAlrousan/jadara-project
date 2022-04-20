import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:jadara_project/models/user.dart';
import 'package:jadara_project/services/dataase_baby.dart';
import 'package:jadara_project/services/database_elderly.dart';
import 'package:jadara_project/services/database_lite.dart';
import 'package:jadara_project/widgets/user_profile_image.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'profile screen.dart';
import '../data.dart';

class job_elderly extends StatelessWidget {
  Elderly _elderly;
  job_elderly(this._elderly);
  MyDatabase myDatabase=MyDatabase();


  String swch( String busy)
  {
    if(profile_screen.isSwitched==true)
      busy="busy";
    else
      busy = "not busy";


    return busy;
  }

  String s=" ";

  Profile_Screen profile_screen=Profile_Screen(switch1);
  // const Job_Screen({Key? key, required this.profile_screen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * .4,
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
                      child: Padding(padding:const EdgeInsets.all(20.0),
                        child: userprofileimage(size: 150,
                          imageUrl: currentUser.imageURL,),) ,
                    ),
                    Text(_elderly.elderly_name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),
                    SizedBox(
                      height: 20,
                    ),


                    Text(swch(s),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2),
                    ),

                    SizedBox(
                        height: 60,
                        width: 300,

                        child: RaisedButton(
                          color: Colors.white54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),

                          child: Text('Rating',style: TextStyle(color: Colors.teal, fontSize: 18),),
                          onPressed: () async {
                            int stars = await showDialog(context: context,
                              builder: (_) => RatingDialog(title: "Rating", submitButton: "submit", onSubmitted:(response){},
                              ), );
                            if(stars == null) return;

                            print('Selected rate stars: $stars');
                          },
                        )

                    ),


                  ],

                )
              ],
              ),

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
                    height: 40,
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
                      Text(_elderly.elderly_name,
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 40,
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
                      Text(_elderly.elderly_phone.toString(),
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("email :",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(_elderly.elderly_email,
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text("city :",
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(_elderly.elderly_city,
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 40,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text('experience',
                            style: TextStyle(fontSize: 12),

                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              )

            ]
        ),
      ) ,
    );
  }


}
