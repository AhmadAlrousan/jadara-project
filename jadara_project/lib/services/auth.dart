import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User1 {
  final String uid;

  User1({required this.uid});
}

class AuthBase {
  User1? _userFromFirebase(User user) {
    // return user != null ? User1(uid: user.uid):null;
    if (user != null) {
      return User1(uid: user.uid);
    } else {
      return null;
    }
  }

  Future<void> singupwithEmailAndpass(String email , String pass,String name,String uname,int phone ) async
  {
    try {
      final authResult = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass);

      authResult.user!.uid;
    } catch (e) {
      print(e.toString());
      
      return null;
    }
  }
  Future<void> loginwithEmailAndpass(String email , String pass) async
  {
    try{
    final authResult= await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass);
    authResult.user!.uid;

  } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> logout() async
  {
    await FirebaseAuth.instance.signOut();
  }

 }