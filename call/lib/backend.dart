import 'package:sqflite/sqflite.dart';
import 'package:call/Models/User.dart';
import 'package:flutter/material.dart';

class Db extends ChangeNotifier {
  late Database db;
  late User user;
  Future<void> initDb() async {
    db = await openDatabase('Userinfo.db', version: 1,
        onCreate: (Database db, int version) {
      db.execute(
          'CREATE TABLE User(id INTEGER PRIMARY KEY ,Phnum VARCAHR(10) )');
    });

    await db.rawInsert('INSERT INTO User(Phnum) VALUES(?)', ["Add Number"]);
    List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT * FROM User WHERE id=1');
    user = User.fromMap(result[0]);
    print(user);
  }

  Future<void> getData() async {
    await initDb();
    List<Map<String, dynamic>> data =
        await db.rawQuery('SELECT * FROM User WHERE id=1');
    if (data.isNotEmpty) {
      user = User.fromMap(data[0]);
    } else {
      user = User(id: 1, phone: "add");
      notifyListeners();
    }
  }

  Future<void> updateData(String phnum) async {
    await db.rawUpdate('UPDATE User SET Phnum=? WHERE id=?', [phnum, 1]);
    user.phone = phnum;
    notifyListeners();
  }
}
