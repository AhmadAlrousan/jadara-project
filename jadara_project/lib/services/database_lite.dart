import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:jadara_project/services/database_elderly.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'database_Users.dart';
import 'dataase_baby.dart';

    class MyDatabase {


         Future<Database> user_database()async{
          return openDatabase(
          join(await getDatabasesPath(), "user_db.db"),
          onCreate: (db, version) {
         return db.execute(
         "CREATE TABLE user(id INTEGER PRIMARY KEY autoincrement , name TEXT ,  phone INTEGER , password TEXT , email TEXT UNIQUE ,city TEXT) ");
        },
         version: 1,
          )  ;
        }

         Future<Database> baby_database()async{
           return openDatabase(
             join(await getDatabasesPath(), "baby_db.db"),
             onCreate: (db, version) {
               return db.execute(
          "CREATE TABLE baby(id INTEGER PRIMARY KEY autoincrement , name TEXT ,  phone INTEGER , password TEXT , email TEXT UNIQUE ,city TEXT,) ");
             },
             version: 1,
           );
         }

         Future<Database> elderly_database()async{
           return openDatabase(
             join(await getDatabasesPath(), "elderly_db.db"),
             onCreate: (db, version) {
               return db.execute(
             "CREATE TABLE elderly (id INTEGER PRIMARY KEY autoincrement , name TEXT ,  phone INTEGER , password TEXT , email TEXT UNIQUE ,city TEXT) ");
             },
             version: 1,
           );
         }
         //
         // Future<int> createUsers(Users users)async{
         //   Database db = await user_database();
         //   return db.insert("user",{'name':users.user_name , 'phone':users.user_phone , 'email':users.user_email ,'password':users.user_password , 'city':users.user_city });
         //   // return db.insert("user",users.toMap());
         //
         // }
         Future<int> createUsers(Users users)async{
           Database db = await user_database();

           return db.insert("user",{'name':users.user_name , 'phone':users.user_phone , 'email':users.user_email, 'password':users.user_password , 'city':users.user_city ,  });

         }



         Future<int> createBaby(Baby baby)async{
           Database db = await baby_database();

          return db.insert("baby",{'name':baby.baby_name , 'phone':baby.baby_phone , 'email':baby.baby_email, 'password':baby.baby_password , 'city':baby.baby_city ,  });
          //  return db.insert("baby",baby.toMap());

      }

         Future<int> createElderly(Elderly elderly)async{
           Database db = await elderly_database();
           return db.insert("elderly",{'name':elderly.elderly_name , 'phone':elderly.elderly_phone , 'email':elderly.elderly_email,'password':elderly.elderly_password , 'city':elderly.elderly_city});
         }







        // insert data مش شغال
        Future<void> insert_users(Users users) async {
        final Database db = await user_database();
        await db.insert("user",
        users.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
        );
        db.close();
        }

         Future<void> insert_baby(Baby baby) async {
           final Database db = await baby_database();
           await db.insert("baby",
             baby.toMap(),
             conflictAlgorithm: ConflictAlgorithm.replace,
           );
           db.close();
         }

         Future<void> insert_elderly(Elderly elderly) async {
           final Database db = await elderly_database();
           await db.insert("elderly",
             elderly.toMap(),
             conflictAlgorithm: ConflictAlgorithm.replace,
           );
           db.close();
         }


         // update data لم يستخدم

        Future<void> update_users(Users users) async {
        final Database db = await user_database();
        await db.update("user",
        users.toMap(),
        where: "id=?",
        whereArgs: [users.user_id],
        );
        db.close();

        }

         Future<void> update_baby(Baby baby) async {
           final Database db = await baby_database();
           await db.update("baby",
             baby.toMap(),
             where: "id=?",
             whereArgs: [baby.baby_id],
           );
           db.close();

         }

         Future<void> update_elderly(Elderly elderly) async {
           final Database db = await elderly_database();
           await db.update("elderly",
             elderly.toMap(),
             where: "id=?",
             whereArgs: [elderly.elderly_id],
           );
           db.close();

         }


         // delete data لم يستخدم

        Future<void> delete_users(int id) async {
         Database db = await user_database();
        await db.delete("user",
        where: "id=?",
        whereArgs: [id],
        );

        }

         Future<void> delete_baby(int id) async {
            Database db = await baby_database();
           await db.delete("baby",
             where: "id=?",
             whereArgs: [id],
           );

         }

         Future<void> delete_elderly(int id) async {
           Database db = await elderly_database();
           await db.delete("elderly",
             where: "id=?",
             whereArgs: [id],
           );

         }


      // Future<dynamic>   get_baby_byId(int id) async {
      //      Database db = await baby_database();
      //
      //     var result= await db.query("baby",where: "id=?",whereArgs: [id]);
      //
      //    }


        // List<Map> result = await db.rawQuery('SELECT * FROM my_table WHERE name=?', ['Mary']);

         // log in
         Future<int> sp_loginU(String email, String password) async {
           Database db = await user_database();
           var count = Sqflite.firstIntValue( await db. rawQuery('SELECT count(*) FROM user WHERE email=?  and password=? ', [email, password] ));  // ['Peter', 'Smith', 2019]
           print(".........0000000000000000................. "+count.toString());
           return int.parse(count.toString());
         }



         Future<int> sp_loginB(String email, String password) async {
           Database db = await baby_database();
           var count = Sqflite.firstIntValue( await db. rawQuery('SELECT count(*) FROM baby WHERE email=?  and password=? ', [email, password] ));  // ['Peter', 'Smith', 2019]
           print(".........0000000000000000................. "+count.toString());
           return int.parse(count.toString());
         }



         Future<int> sp_loginE(String email, String password) async {
           Database db = await elderly_database();
           var count = Sqflite.firstIntValue( await db. rawQuery('SELECT count(*) FROM elderly WHERE email=?  and password=? ', [email, password] ));  // ['Peter', 'Smith', 2019]
           print(".........0000000000000000................. "+count.toString());
           return int.parse(count.toString());
         }

       // for profile

         Future<Baby> sp_getBaby(String email) async {
           Database db = await baby_database();
           var result = ( await db. rawQuery('SELECT * FROM baby WHERE email=? ', [email] ));  // ['Peter', 'Smith', 2019
           //if (result.length > 0) {
           //  return new Baby.fromMap(result.first);
           //}
           return ( new Baby.fromMap(result.first)); //await db. rawQuery('SELECT * FROM baby WHERE email=? ', [email] ));
         }


         Future<Users> sp_getUser(String email) async {
           Database db = await user_database();
           var result = ( await db. rawQuery('SELECT * FROM user WHERE email=? ', [email] ));  // ['Peter', 'Smith', 2019
           //if (result.length > 0) {
           //  return new Baby.fromMap(result.first);
           //}
           return ( new Users.fromMap(result.first)); //await db. rawQuery('SELECT * FROM baby WHERE email=? ', [email] ));
         }


         Future<Elderly> sp_getElderly(String email) async {
           Database db = await elderly_database();
           var result = ( await db. rawQuery('SELECT * FROM elderly WHERE email=? ', [email] ));  // ['Peter', 'Smith', 2019
           //if (result.length > 0) {
           //  return new Baby.fromMap(result.first);
           //}
           return ( new Elderly.fromMap(result.first)); //await db. rawQuery('SELECT * FROM baby WHERE email=? ', [email] ));
         }

         //option


        Future<List> list_baby() async {
         Database db = await baby_database();

       return db.query('baby');


        }
         Future<List> list_user() async {
           final Database db = await user_database();

           return db.query('user');



         }

         Future<List> list_elderly() async {
           final Database db = await elderly_database();

           return db.query('elderly');

         }












         // مش شغال

         Future<Baby> getLogin(String email, String password) async {
           Database db = await baby_database();
           var res = await db.rawQuery("SELECT * FROM user WHERE username = '$email' and password = '$password'");

           if (res.length > 0) {
             return new Baby.fromMap(res.first);
           }

           return null!;
         }




    }



