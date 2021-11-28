import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';
import 'package:learn_flutter_database/models/Transaction.dart';
import 'package:provider/provider.dart';


class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transaction> transactions = [
    Transaction(title: "ซื้อหนังสือ", amount: 500, date: DateTime.now()),
    Transaction(title: "ซื้อเสื้อผ้า", amount: 900, date: DateTime.now()),
    Transaction(title: "ซื้อกางเกง", amount: 400, date: DateTime.now()),
    Transaction(title: "ซื้อนาฬิกา", amount: 1400, date: DateTime.now()),
  ];

  //ดึงข้อมูล
  List<Transaction> getTransaction () {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.add(statement);
  }
}
