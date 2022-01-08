import 'package:sqflite/sqflite.dart';

class Db {
  late Database db;
  Future<void>initDb() async{
   db= await openDatabase('Userinfo.db',
       version: 1,
       onCreate:(Database db,int version){
      db.execute('CREATE TABLE User(id INTEGER PRIMARY KEY,Phnum VARCAHR(10) )');
    } );
  }
  Future<void>getData()async{
    var data= await db.rawQuery('SELECT * FROM User');
  }
  Future<void>insertData(String Phnum)async{
      var result =await db.rawInsert('INSERT INTO User(Phnum) VALUES(?)',[Phnum]);
  }

}