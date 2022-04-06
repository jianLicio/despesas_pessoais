import 'package:flutter/material.dart';

class TransacaoForm extends StatelessWidget {
  TransacaoForm({Key? key, required this.onSubmit}) : super(key: key);

  final tituloController = TextEditingController();
  final valorController = TextEditingController();

  final void Function(String, double) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valorController,
              decoration: const InputDecoration(
                labelText: 'Valor(R\$)',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.purple,
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Nova Transação'),
              onPressed: () {
                final titulo = tituloController.text;
                final valor = double.tryParse(valorController.text) ?? 0.0;
                onSubmit(titulo, valor);
              },
            ),
          ],
        ),
      ),
    );
  }
}
