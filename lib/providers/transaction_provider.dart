import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:learn_flutter_database/database/transaction_db.dart';
import 'package:learn_flutter_database/models/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transactions> transactions = [];

  //ดึงข้อมูล
  List<Transactions> getTransaction() {
    return transactions;
  }

  void initData () async {
    var db = TransactionDB(dbName: "transaction.db");
    //ดึงข้อมูลมาแสดงผล
    transactions = (await db.loadAllData());
    notifyListeners();
  }

  void addTransaction(Transactions statement) async {
    // var db = await TransactionDB(dbName: "transaction.db").openDatebase();
    // print(db);
    var db = TransactionDB(dbName: "transaction.db");
    //บันทึกข้อมูล
    await db.InsertData(statement);
    //ดึงข้อมูลมาแสดงผล
    transactions = (await db.loadAllData());
    //แจ้งเตือน consumer
    notifyListeners();
  }
}
