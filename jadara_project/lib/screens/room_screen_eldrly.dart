

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadara_project/models/user.dart';
import 'package:jadara_project/screens/job_eldrly_screen.dart';
import 'package:jadara_project/services/database_elderly.dart';

import 'package:jadara_project/services/database_lite.dart';
import 'package:jadara_project/widgets/user_profile_image.dart';


import '../data.dart';
class Room_eld extends StatefulWidget{
  @override

  RoomScreen_elderly createState()=> RoomScreen_elderly();
}

class RoomScreen_elderly extends State<Room_eld> {

  MyDatabase myDatabase=MyDatabase();

  List item=[];

  getItemsFromDb()async{
    List showItem =  await myDatabase.list_elderly();

    item=showItem;
  }
  void initState(){
    super.initState();
    myDatabase=MyDatabase();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Center(child: Text("E.C.C",style:TextStyle(color: Colors.white),)),
        leading: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,

          ),
          onPressed: () {
            showSearch(context: context, delegate: Datasearch());
          },
        ),
        actions: [


          GestureDetector(
            onTap: (){
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
      body:  FutureBuilder(
        future: myDatabase.list_elderly(),
        builder:(context, AsyncSnapshot snap){
          if(!snap.hasData){
            return CircularProgressIndicator();
          }else{
            return ListView.builder(
              itemCount: snap.data.length ,
              itemBuilder: (context , i){
                Elderly elderly =Elderly.fromMap(snap.data[i]);

                return Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: ListTile(title: Text("${snap.data[i]['name']}"),
                    subtitle: Text("${snap.data[i]['city']}"),

                    onTap:() {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>job_elderly(elderly)));

                    },


                  ),
                ));
              },

            );
          }
        },
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
    return IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back),)   ;
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

// ListView(padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100),
// children: [
//
//   ...item.map((e) => RoomScreenCard(userScreenCard: e, myDatabase: e,))
//
// ],
//
// )