import 'dart:io';

import 'package:learn_flutter_database/models/Transactions.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class TransactionDB {
  // การเกี่ยวกับฐานข้อมูล
  String dbName;

  // ถ้ายังไม่ถูกสร้างให้ทำการสร้าง
  // ถ้าถูกสร้างไว้แล้วให้ทำการเปิด
  TransactionDB({required this.dbName});

  // dbLocation = /users/suphanut taengtoemphon/transaction.db
  // dbName = transaction.db
  Future<Database> openDatebase() async {
    // หาตำแหน่งที่เก็บข้อมูล
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);
    // สร้าง database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  //บันทึกข้อมูล
  InsertData(Transactions statement) async {
    // ฐานข้อมูล => store
    // transaction.db => expense
    var db = await this.openDatebase();
    var store = intMapStoreFactory.store("expense");

    //json
    store.add(db, {
      "title": statement.title,
      "amount": statement.amount,
      "date": statement.date
    });
  }
}
