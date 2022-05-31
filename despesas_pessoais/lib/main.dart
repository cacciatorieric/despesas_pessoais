import 'package:despesas_pessoais/models/transactions.dart';
import 'package:flutter/material.dart';

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
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 310.73,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 100.32,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Primeira estrutura'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment:
              CrossAxisAlignment.stretch, //Estica os elementos filhos
          children: const <Widget>[
            Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Grafico'),
            ),
            Card(
              elevation: 5,
              child: Text('Lista de Transações'),
            ),
          ],
        ));
  }
}
