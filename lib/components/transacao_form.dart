import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransacaoForm extends StatefulWidget {
  const TransacaoForm(this.onSubmit, {Key? key}) : super(key: key);

  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransacaoForm> createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final _tituloController = TextEditingController();
  final _valorController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final titulo = _tituloController.text;
    final valor = double.tryParse(_valorController.text) ?? 0.00;

    if (titulo.isEmpty || valor <= 0) return;

    widget.onSubmit(titulo, valor, _selectedDate);
  }

  _showDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: _tituloController,
                decoration: const InputDecoration(
                  labelText: 'Titulo',
                ),
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (valor) => _submitForm(),
                controller: _valorController,
                decoration: const InputDecoration(
                  labelText: 'Valor(R\$)',
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Text(
                      DateFormat('d/MM/y').format(_selectedDate),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextButton(
                      onPressed: _showDataPicker,
                      child: const Text('Alterar Data'),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.purple,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: Text(
                      'Nova Transação',
                      style: GoogleFonts.acme(fontSize: 24),
                    ),
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
