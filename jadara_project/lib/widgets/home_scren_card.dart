
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadara_project/models/room.dart';
import 'package:jadara_project/screens/room_screen_baby.dart';
import 'package:jadara_project/widgets/user_profile_image.dart';

class HomeCard extends StatelessWidget {
  final Room room;

  const HomeCard({Key? key, required this.room}) : super(key: key);


  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context)
      //     .push(MaterialPageRoute(fullscreenDialog: true, builder: (context)=>RoomScreen(), )),


      //الانتقال الى الصفحة الثانية مع محتويات الروم


      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Padding(

          padding: const EdgeInsets.fromLTRB(5, 5, 5, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                room.name,
                style: TextStyle(fontSize: 25),

              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 310,
                      child: Stack(
                        children: [
                          userprofileimage(imageUrl: room.image, size: 500)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),

        ),
      ),
    );
  }
}
