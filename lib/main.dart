import 'package:flutter/material.dart';
import 'package:learn_flutter_database/models/Transaction.dart';
import 'package:learn_flutter_database/providers/transaction_provider.dart';
import 'package:learn_flutter_database/screens/form_screen.dart';
import 'package:provider/provider.dart';
import 'models/Transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'แอพบัญชี'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormScreen();
                }));
              },
            )
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, child) {
            return ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (context, int index) {
                Transaction data = provider.transactions[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text(data.amount.toString()),
                      ),
                    ),
                    title: Text(data.title),
                    subtitle: Text(data.date.toString()),
                  ),
                );
              },
            );
          },
        ));
  }
}
