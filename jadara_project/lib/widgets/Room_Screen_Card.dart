import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadara_project/models/room.dart';
import 'package:jadara_project/models/user.dart';
import 'package:jadara_project/screens/job_screen.dart';
import 'package:jadara_project/services/database_lite.dart';
import 'package:jadara_project/widgets/user_profile_image.dart';


class RoomScreenCard extends StatelessWidget {
  final User userScreenCard;
  final MyDatabase myDatabase;

   RoomScreenCard( {Key? key,required this.myDatabase, required this.userScreenCard}) : super(key: key);

   List item=[];

   // getItemsFromDb()async{
   // List showItem =  await myDatabase.list_baby();
   //
   //   item=showItem;
   // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Navigator.of(context),
        // .push(MaterialPageRoute(fullscreenDialog: true, builder: (_)=>Job_Screen(), )),


      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          children: [
            Text(
              userScreenCard.firstName,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              userScreenCard.job,
              style: TextStyle(fontSize: 15),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    child: Stack(
                      children: [
                        userprofileimage(imageUrl: userScreenCard.imageURL, size: 90)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    )
    );
  }
}
