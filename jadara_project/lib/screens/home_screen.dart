import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadara_project/data.dart';
import 'package:jadara_project/widgets/home_scren_card.dart';
import 'package:jadara_project/widgets/user_profile_image.dart';
import 'package:jadara_project/models/room.dart';


class HomeScreens extends StatelessWidget {

  Future getData() async{
    // جلب الداتا من قواعد البيانات بعدين بتريطها بايقونة البحث
    // هاض الفيديو ممكن يفيدك "https://www.youtube.com/watch?v=RU9qinH65l8"
  }
  const HomeScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        title: Center(child: Text("E.C.C",style:TextStyle(color: Colors.white) ,)),
        leading: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          onPressed: (){
            showSearch(context: context, delegate: Datasearch());
          }
        ),
        actions: [

          // IconButton(
          //   icon: Icon(
          //     CupertinoIcons.bell,
          //     size: 30,
          //   ),
          //   onPressed: () {},
          // ),
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

      body: ListView(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 50),

        children: [
          ...roomList.map((e) => HomeCard(room:e)),


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


