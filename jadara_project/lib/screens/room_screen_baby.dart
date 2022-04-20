


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadara_project/models/user.dart';
import 'package:jadara_project/screens/job_screen.dart';
import 'package:jadara_project/services/dataase_baby.dart';
import 'package:jadara_project/services/database_lite.dart';
import 'package:jadara_project/widgets/Room_Screen_Card.dart';
import 'package:jadara_project/widgets/user_profile_image.dart';


import '../data.dart';
class Rooms extends StatefulWidget{
  @override

  RoomScreen createState()=> RoomScreen();
}

class RoomScreen extends State<Rooms> {

   MyDatabase myDatabase=MyDatabase();

   // List item=[];

   // getItemsFromDb()async{
   //   List showItem =  await myDatabase.list_baby();
   //
   //   item=showItem;
   // }
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
      // option screen

      body:  FutureBuilder(
        future: myDatabase.list_baby(),
        builder:(context, AsyncSnapshot snap){
          if(!snap.hasData){
            return CircularProgressIndicator();
          }else{
            return ListView.builder(
              itemCount: snap.data.length ,
              itemBuilder: (context ,i){

                Baby baby =Baby.fromMap(snap.data[i]);

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: ListTile(title: Text("${snap.data[i]['name']}"),
                    subtitle: Text("${snap.data[i]['city']}"),
                    onTap:()async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Job_Screen(baby)));
                      // Navigator.pushReplacement(
                      //   context,MaterialPageRoute(builder: (context) => Job_Screen(baby)),);
                      // Navigator.of(context).pushReplacementNamed('job');

                    },


                  ),

                )
                );
              },

            );
          }
        },
      ),


      // ListView(padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100),
      // children: [
      //
      //   ...item.map((e) => RoomScreenCard(userScreenCard: e, myDatabase: e,))
      //
      // ],
      //
      // )



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