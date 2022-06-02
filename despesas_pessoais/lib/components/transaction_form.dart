import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm(
    this.onSubmit,
  );

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      Fluttertoast.showToast(msg: 'Preecha corretamente os campos ');
      return;
    }
    onSubmit(title, value);
  }

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  //Este widget precisa se comunicar com o "widget pai", para isso criamos uma função (que recebe os tipos de dados que ele vai transmitir, e um construtor para receber argumentos.)

  final void Function(String, double) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: valueController,
              decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              onSubmitted: (_) {
                _submitForm();
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: const Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
