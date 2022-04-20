import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadara_project/models/Statics.dart';
import 'package:jadara_project/services/auth.dart';
import 'package:jadara_project/services/dataase_baby.dart';
import 'package:jadara_project/services/database_Users.dart';
import 'package:jadara_project/services/database_elderly.dart';
import 'package:jadara_project/services/database_lite.dart';
import 'package:jadara_project/widgets/button.dart';
import 'package:jadara_project/widgets/user_profile_image.dart';

import '../data.dart';


class HomeScreens2 extends StatelessWidget {
  AuthBase authBase = AuthBase();
  MyDatabase myDatabase=MyDatabase();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Center(child: Text("E.C.C",style:TextStyle(color: Colors.white) ,)),
        leading:  IconButton(
          icon: Icon(
            CupertinoIcons.square_arrow_left,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () async {
            Navigator.of(context).pushReplacementNamed('login');
          },
        ),
        actions: [

          GestureDetector(
            onTap: ()async{

              //Baby userBaby = await myDatabase.sp_getUser(PREFS.USER);
              //currentUser = userBaby;
              if(PREFS.TYPE == "U"){
                Users res = await myDatabase.sp_getUser(PREFS.USER);
                PREFS.NAME = res.user_name;
                PREFS.PHONE = res.user_phone;
                PREFS.CITY = res.user_city;
              }
              else if(PREFS.TYPE == "B"){
                Baby res = await myDatabase.sp_getBaby(PREFS.USER);
                PREFS.NAME = res.baby_name;
                PREFS.PHONE = res.baby_phone;
                PREFS.CITY = res.baby_city;
              }
              else if(PREFS.TYPE == "E"){
                Elderly res = await myDatabase.sp_getElderly(PREFS.USER);
                PREFS.NAME = res.elderly_name;
                PREFS.PHONE = res.elderly_phone;
                PREFS.CITY = res.elderly_city;
              }


              Navigator.of(context).pushNamed('profile_screen');
            }, // بتقدر تخلي الصورة تنقلك الى صفحة الشخصية
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: userprofileimage(size: 40,
                imageUrl: currentUser.imageURL,),
            ),
          ),



        ],
      ),

      body:
      Column(
        children: [

          Card(

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),

            color: Colors.white,
            child: Padding(

              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(

                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                  " جليسات اطفال",
                    style: TextStyle(fontSize: 25),

                  ),

                  Row(
                    children: [

                      Expanded(
                        child: Container(
                          height: 256,
                          child: Stack(
                            children: [
                              userprofileimage(imageUrl:'https://images.pexels.com/photos/7282247/pexels-photo-7282247.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', size: 500)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                     ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          textColor: Colors.teal,
                          child: Center(child: const Text("click")),
                          onPressed:  () {
                            Navigator.of(context).pushNamed("room_screen");
                          },
                        )
                      ],
                    ),

                ],
              ),

            ),

          ),


          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: Colors.white,
            child: Padding(

              padding: const EdgeInsets.fromLTRB(15, 15, 5, 6),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,

                children: [
                  // InkWell(
                  //   onTap:(){
                  //     Navigator.of(context).pushNamed('profile_screen');
                  //   } ,
                  //   child: const SizedBox(
                  //     width: 100,
                  //     height: 15,
                  //   ),
                  // ),
                  Text(
                    "كبار السن",
                    style: TextStyle(fontSize: 25),

                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 256,
                          child: Stack(
                            children: [
                              userprofileimage(imageUrl: 'https://images.pexels.com/photos/7551681/pexels-photo-7551681.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', size: 500)
                             ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          textColor: Colors.teal,
                          child: const Text("click"),
                          onPressed:  () {
                            Navigator.of(context).pushNamed("Room_elderly");
                          },
                        )
                      ],
                    ),
                  ),
                ],

              ),

            ),
          ),
        ],

      ),



    );
  }
}
class Datasearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for appBar
    return[
      IconButton(onPressed:(){} ,icon: Icon(Icons.clear),)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icon leading
    return IconButton(onPressed: (){
      close(context, query);
    }, icon: Icon(Icons.arrow_back),)   ;
  }

  @override
  Widget buildResults(BuildContext context) {
    // نتيجة البحث
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // الشيء الي بضهر عند البحث
    return Text("");
  }

}
