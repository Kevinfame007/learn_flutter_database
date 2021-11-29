import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:learn_flutter_database/models/Transaction.dart';
import 'package:provider/provider.dart';


class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transaction> transactions = [];

  //ดึงข้อมูล
  List<Transaction> getTransaction () {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.insert(0,statement);
    //แจ้งเตือน consumer
    notifyListeners();
  }
}
