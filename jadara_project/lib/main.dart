
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jadara_project/constant.dart';
import 'package:jadara_project/screens/HomeScreens2.dart';
import 'package:jadara_project/screens/Login_screen.dart';
import 'package:jadara_project/screens/SingUp_screen.dart';
import 'package:jadara_project/screens/home_screen.dart';
import 'package:jadara_project/screens/Start_screen.dart';
import 'package:jadara_project/screens/job_screen.dart';
import 'package:jadara_project/screens/profile%20screen.dart';
import 'package:jadara_project/screens/room_screen_baby.dart';
import 'package:jadara_project/screens/room_screen_eldrly.dart';
import 'package:jadara_project/services/dataase_baby.dart';
import 'package:jadara_project/services/database_Users.dart';
import 'package:jadara_project/services/database_elderly.dart';
import 'package:jadara_project/services/database_lite.dart';


 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   MyDatabase myDatabase=MyDatabase();
   await myDatabase.user_database();
   // await myDatabase.baby
   // await myDatabase.eldery

  // await myDatabase.insert_users(Users(user_id: 0,user_name: "ahmad",user_phone: 0777774896,user_password: "123456",user_email: "ahmad11@gmail.com", user_city: "amman"));
  // await myDatabase.insert_users(Users(user_id: 1,user_name: "sara",user_phone: 0798245250,user_password: "123456789",user_email: "sara@gmail.com", user_city: "amman"));
  // await myDatabase.insert_users(Users(user_id: 2,user_name: "yamn",user_phone:0798532148,user_password: "123456789",user_email: "yamn@gmail.com", user_city: "amman"));
  // await myDatabase.insert_users(Users(user_id: 3,user_name: "jehad",user_phone: 0777894896,user_password: "123456789",user_email: "jehad@gmail.com", user_city: "amman"));
  //
  //
  // await myDatabase.insert_baby(Baby(baby_id: 0,baby_name: "dema",baby_phone: 0777774896,baby_password: "123456789",baby_email: "dema@gmail.com", baby_city: "amman"));
  // await myDatabase.insert_baby(Baby(baby_id: 1,baby_name: "rafef",baby_phone: 0798245250,baby_password: "123456789",baby_email: "rafef@gmail.com", baby_city: "amman"));
  // await myDatabase.insert_baby(Baby(baby_id: 2,baby_name: "farah",baby_phone:0798532148,baby_password: "123456789",baby_email: "farah@gmail.com", baby_city: "amman"));
  // await myDatabase.insert_baby(Baby(baby_id: 3,baby_name: "tala",baby_phone: 0777894896,baby_password: "123456789",baby_email: "tala@gmail.com", baby_city: "amman"));
  // await myDatabase.insert_baby(Baby(baby_id: 4,baby_name: "dana",baby_phone: 0777879896,baby_password: "123556789",baby_email: "dana@gmail.com", baby_city: "amman"));
  // await myDatabase.insert_baby(Baby(baby_id: 5,baby_name: "amal",baby_phone: 0789879876,baby_password: "12355589",baby_email: "amal@gmail.com", baby_city: "amman"));

  // await myDatabase.delete_baby(0);
  // await myDatabase.delete_baby(1);
  // await myDatabase.delete_baby(2);
  // await myDatabase.delete_baby(3);
  // await myDatabase.delete_baby(4);
  // await myDatabase.delete_baby(5);
  // await myDatabase.delete_baby(10);
  // await myDatabase.delete_baby(11);


  //
  // await myDatabase.insert_elderly(Elderly(elderly_id: 0,elderly_name: "amal",elderly_phone: 0777774896,elderly_password: "123456789",elderly_email: "amal@gmail.com", elderly_city: "amman"));
  // await myDatabase.insert_elderly(Elderly(elderly_id: 1,elderly_name: "sara",elderly_phone: 0798245250,elderly_password: "123456789",elderly_email: "sara@gmail.com", elderly_city: "amman"));
  // await myDatabase.insert_elderly(Elderly(elderly_id: 2,elderly_name: "yaman",elderly_phone:0798532148,elderly_password: "123456789",elderly_email: "yaman@gmail.com", elderly_city: "amman"));
  // await myDatabase.insert_elderly(Elderly(elderly_id: 3,elderly_name: "hala",elderly_phone: 0777894896,elderly_password: "123456789",elderly_email: "hala@gmail.com", elderly_city: "amman"));


  // await myDatabase.delete_elderly(4);
  // await myDatabase.delete_elderly(5);
  // await myDatabase.delete_elderly(6);
  // await myDatabase.delete_elderly(7);



  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  late Baby baby;


  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "elderly children care" ,
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
       appBarTheme: AppBarTheme(backgroundColor: kBackgroundColor),
       scaffoldBackgroundColor:kBackgroundColor,
       primaryColor: Colors.white,
       accentColor:kAccentColor,
       iconTheme:IconThemeData(color: Colors.black),

       fontFamily:GoogleFonts.montserrat().fontFamily, //                   هون استخدمنا بكج googlefontes
       textTheme: GoogleFonts.montserratTextTheme()    ,  //                   هون استخدمنا بكج googlefontes

       inputDecorationTheme:InputDecorationTheme(
         filled: true ,
         fillColor: Color(0xfff2f9fe),
         enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.teal),
           borderRadius: BorderRadius.circular(25),

         ),
         disabledBorder:  OutlineInputBorder(
           borderSide: BorderSide(color: Colors.teal),
           borderRadius: BorderRadius.circular(25),

         ),
         focusedBorder:  OutlineInputBorder(
           borderSide: BorderSide(color: Colors.teal),
           borderRadius: BorderRadius.circular(25),

         ),
       )
     ),
     home: Start_screen(),
     routes: {
       'login':(context)=> Login_Screen(authTypelog: AuthTypelog.login,),
       'home':(context)=>HomeScreens(),
       'singup':(context)=>SingUp(authType:AuthType.singup,),
       'profile_screen':(context)=>switch1(),
       'job':(context)=>Job_Screen(baby),
       // 'job':(context)=>Jobs(),
       'room_screen':(context)=>Rooms(),
       'Room_elderly':(context)=>Room_eld(),
       'home2':(context)=>HomeScreens2(),



     },

   );
  }

}
