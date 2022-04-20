import 'package:flutter/material.dart';
class Button extends StatelessWidget {

  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        color: Colors.teal,
        onPressed:(){
          Navigator.of(context).pushNamed("login");
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        child: Text("Get Started",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18
          ),),
      ),
    );
  }
}
