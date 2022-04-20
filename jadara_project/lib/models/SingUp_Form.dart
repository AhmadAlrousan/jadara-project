

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jadara_project/data.dart';
import 'package:jadara_project/models/user.dart';
import 'package:jadara_project/services/auth.dart';
import 'package:jadara_project/services/dataase_baby.dart';
import 'package:jadara_project/services/database_Users.dart';
import 'package:jadara_project/services/database_elderly.dart';
import 'package:jadara_project/widgets/button.dart';
import 'package:jadara_project/screens/SingUp_screen.dart';
import 'package:jadara_project/services/database_lite.dart';


extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'@')
        .hasMatch(this);
  }
}

class SingUpForm extends StatefulWidget {
  final AuthType authType;
  @override
  const SingUpForm({Key? key, required this.authType,}) : super(key: key);


  _SingUpFormState createState() => _SingUpFormState();

}


enum SingingCharacter { male, female }
enum SingingCharacter2 {user,baby,ederly }
enum SingingCharacter3 {irbid,amman,alzarqa,alaqaba}




class _SingUpFormState extends State<SingUpForm> {

SingingCharacter? _character=SingingCharacter.male;
SingingCharacter2? _character2=SingingCharacter2.user;
SingingCharacter3? _character3=SingingCharacter3.irbid;


final _formKey=GlobalKey<FormState>();
String _email=" ", _password=" ",_name=" " , _city=" " , _experience=" ";
int _phone=0 , _id=0;
AuthBase authBase=AuthBase();

MyDatabase myDatabase=MyDatabase();

// insert_user_item() async{
//   myDatabase.insert_user_ToDb(_name, _email,  _phone, _password);
//  return myDatabase.insert_user_ToDb(_name, _email,  _phone, _password);
//
// }
// insert_baby_item() async {
//    myDatabase.insert_baby_ToDb(_name, _email,  _phone, _password);
//   return myDatabase.insert_baby_ToDb(_name, _email,  _phone, _password);
//
// }

@override
  void initState() {
    super.initState();
    myDatabase=MyDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children:<Widget>[
          Form(
              key: _formKey,
              child: Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 18) ,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value)=>_name=value,
                  validator: (value) => value!.isEmpty ? 'Enter a valid name': null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(25),
                  ],
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Enter your Name',

                  ),
                ),

                SizedBox(height: 13,),
                TextFormField(
                  onChanged: (value)=>_email=value,
                  validator: (value) => value!.isEmpty ? 'Enter a valid email' : value.isValidEmail() ? null : "Enter a valid email" ,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(33),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    hintText: 'ex : test@gmail.com',
                  ),
                ),

                 SizedBox(height: 13,),
                 TextFormField(
                   onChanged: (value)=>_city=value,
                   validator: (value) => value!.isEmpty ? 'Enter a valid location': null,
                   inputFormatters: [
                     LengthLimitingTextInputFormatter(25),
                   ],
                   decoration: InputDecoration(
                     labelText: 'Enter your location',
                   ),
                 ),

                SizedBox(height: 13,),
                TextFormField(
                  onChanged: (value)=>_phone=int.parse( value),
                  validator: (value) => value!.isEmpty ? 'Enter a valid phone': null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Enter your phone',
                    hintText: 'ex : 07...',
                  ),
                  keyboardType: TextInputType.phone,


                ),

                SizedBox(height: 13,),
                TextFormField(
                  onChanged: (value)=>_password=value,

                  validator: (value) => value!.length<6 ? ' your password must e lager than 6 characters' : null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Enter your password',

                  ),
                  obscureText: true,
                ),

                SizedBox(height: 13,),
                TextFormField(
                  onChanged: (value)=>_experience=value,
                  validator: (value) => value!.isEmpty ? 'Enter a valid experience': null,

                  decoration: InputDecoration(
                    labelText: 'Enter your experience',

                  ),
                ),

                SizedBox(height: 13,),
                Text("gender", style:TextStyle(fontSize: 16.0),),



                SizedBox(height: 2,),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio<SingingCharacter>(
                      value: SingingCharacter.male,
                      groupValue:_character,
                      onChanged:(SingingCharacter? value){
                        setState(() {
                          _character = value;
                        });
                      },
                      focusColor: Colors.teal,



                    ),
                    new Text(
                      'male',
                      style: new TextStyle(fontSize: 16.0),
                    ),

                    new Radio<SingingCharacter>(
                      value: SingingCharacter.female,
                      groupValue:_character,
                      onChanged:(SingingCharacter? value){
                        setState(() {
                          _character = value;
                        });
                      },
                      focusColor: Colors.teal,



                    ),
                    new Text(
                      'female',
                      style: new TextStyle(
                        fontSize: 16.0,

                      ),
                    ),


                  ],
                ),
                // SizedBox(height: 13,),
                // Text("job", style:TextStyle(fontSize: 16.0),),
                //
                //
                //
                // SizedBox(height: 2,),
                // new Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //
                //     new Radio<SingingCharacter2>(
                //       value: SingingCharacter2.baby,
                //       groupValue:_character2,
                //       onChanged:(SingingCharacter2? value){
                //         setState(() {
                //           _character2 = value;
                //         });
                //       },
                //       focusColor: Colors.teal,
                //
                //
                //
                //     ),
                //     new Text(
                //       'baby sitter',
                //       style: new TextStyle(fontSize: 16.0),
                //     ),
                //
                //
                //     new Radio<SingingCharacter2>(
                //       value: SingingCharacter2.ederly,
                //       groupValue:_character2,
                //       onChanged:(SingingCharacter2? value){
                //         setState(() {
                //           _character2 = value;
                //         });
                //       },
                //       focusColor: Colors.teal,
                //
                //
                //
                //     ),
                //     new Text(
                //       'elderly',
                //       style: new TextStyle(
                //         fontSize: 16.0,
                //
                //       ),
                //     ),
                //
                //     new Radio<SingingCharacter2>(
                //       value: SingingCharacter2.user,
                //       groupValue:_character2,
                //       onChanged:(SingingCharacter2? value){
                //         setState(() {
                //           _character2 = value;
                //         });
                //       },
                //       focusColor: Colors.teal,
                //
                //
                //
                //     ),
                //     new Text(
                //       'user',
                //       style: new TextStyle(
                //         fontSize: 16.0,
                //
                //       ),
                //     ),
                //
                //
                //   ],
                // ),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                        height: 60,
                        width: 128,
                        child: RaisedButton(
                          color: Colors.teal,
                          onPressed: () async {


                            if(_formKey.currentState!.validate()){
                            if(widget.authType==AuthType.singup)
                              await authBase.singupwithEmailAndpass(_email, _password,_name,_city,_phone);
                            Navigator.of(context).pushReplacementNamed('login');

                            Users users=Users(user_id: _id,user_name: _name,user_email: _email , user_password: _password, user_phone: _phone, user_city: _city,);
                            int id = await myDatabase.createUsers(users);

                            myDatabase.user_database();

                            Navigator.of(context).pushReplacementNamed('login');

                            }

                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "Sing Up   as user",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),

                     SizedBox(width: 3,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                        height: 60,
                        width: 128,
                        child: RaisedButton(
                          color: Colors.teal,
                          onPressed: () async {




                            if(_formKey.currentState!.validate()){
                              if(widget.authType==AuthType.singup)
                                await authBase.singupwithEmailAndpass(_email, _password,_name,_city,_phone);
                              Navigator.of(context).pushReplacementNamed('login');

                              Elderly elderly=Elderly(elderly_id: _id,elderly_name: _name,elderly_email: _email , elderly_password: _password, elderly_phone: _phone, elderly_city: _city);
                              int id = await myDatabase.createElderly(elderly);

                              myDatabase.elderly_database();
                              Navigator.of(context).pushReplacementNamed('login');


                            }

                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "Sing Up as elderly care",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 7,),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: SizedBox(
                        height: 60,
                        width: 128,
                        child: RaisedButton(
                          color: Colors.teal,
                          onPressed: () async {




                            if(_formKey.currentState!.validate()){
                              if(widget.authType==AuthType.singup)
                                await authBase.singupwithEmailAndpass(_email, _password,_name,_city,_phone,);
                              Navigator.of(context).pushReplacementNamed('login');

                              Baby baby=Baby(baby_id: _id,baby_name: _name,baby_email: _email , baby_password: _password, baby_phone: _phone, baby_city: _city,);
                              int id = await myDatabase.createBaby(baby);

                              myDatabase.baby_database();
                              Navigator.of(context).pushReplacementNamed('login');

                            }

                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "Sing Up as babysitter",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ))
        ]
    );
  }
}
