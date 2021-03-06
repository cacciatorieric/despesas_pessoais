import 'dart:math';
import 'package:despesas_pessoais/components/chart.dart';
import 'package:despesas_pessoais/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'components/transaction_list.dart';
import 'models/transactions.dart';

main() {
  runApp(const ExpensesApp());
}

//Projeto de 1 semana terminado

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData temaClaro = ThemeData();

    return MaterialApp(
      home: MyHomePage(),
      theme: temaClaro.copyWith(
        colorScheme: temaClaro.colorScheme.copyWith(
          primary: const Color.fromARGB(255, 146, 219, 214),
          secondary: const Color.fromARGB(255, 73, 158, 154),
          tertiary: const Color.fromARGB(255, 71, 71, 71),
        ),
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontFamily: 'VarelaRound',
            fontSize: 16,
            color: Color.fromARGB(255, 73, 158, 154),
          ),
        ),

//Podemos deixar os padroes universais aqui dentro, tanto para apenas o appbar quanto para o resto do app
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'Offside',
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions {
    return _transactions.where(
      (tr) {
        return tr.date!.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _openTransactionFormModal(context);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
        title: const Text(
          'Despesas Pessoais',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.stretch, //Estica os elementos filhos
          children: <Widget>[
            Chart(recentTransactions: _recentTransactions),
            TransactionList(
              _transactions,
              _deleteTransaction,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          _openTransactionFormModal(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
