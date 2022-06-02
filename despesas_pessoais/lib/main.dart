import 'package:flutter/material.dart';
import 'components/transaction_user.dart';

main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Primeira estrutura'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.stretch, //Estica os elementos filhos
            children: const <Widget>[
              Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Grafico'),
              ),
              TransactionUser(),
            ],
          ),
        ));
  }
}
