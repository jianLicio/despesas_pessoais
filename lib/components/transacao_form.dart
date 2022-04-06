import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {
  const TransacaoForm(this.onSubmit, {Key? key}) : super(key: key);

  final void Function(String, double) onSubmit;

  @override
  State<TransacaoForm> createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final tituloController = TextEditingController();

  final valorController = TextEditingController();

  _submitForm() {
    final titulo = tituloController.text;
    final valor = double.tryParse(valorController.text) ?? 0.00;

    if (titulo.isEmpty || valor <= 0) return;

    widget.onSubmit(titulo, valor);
  }

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
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (valor) => _submitForm(),
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
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
