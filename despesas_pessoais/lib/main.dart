import 'package:despesas_pessoais/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: Text(
                          'R\$ ${tr.value}',
                          style: const TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date!),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ));
                },
              ).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(labelText: 'Titulo'),
                    ),
                    const TextField(
                      decoration: InputDecoration(labelText: 'Valor (R\$)'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Nova Transação'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
