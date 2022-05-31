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
          children: <Widget>[
            const Card(
              color: Colors.blue,
              elevation: 5,
              child: Text('Grafico'),
            ),
            Column(
              children: _transactions.map(
                (tr) {
                  //Map usado para converter a lista em um elemento visual
                  return Card(
//O "elemento tr" vai percorrer a lista e por agora vai pegar apenas o title
                      child: Row(
                    children: [
                      Container(
                        child: Text(
                          tr.value.toString(),
                        ),
                      ),
                      Column(
                        children: [
                          Text(tr.title!),
                          Text(
                            tr.date!.toIso8601String(),
                          ),
                        ],
                      )
                    ],
                  ));
                },
              ).toList(),
            )
          ],
        ));
  }
}
