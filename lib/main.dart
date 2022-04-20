import 'dart:math';

import 'package:despesas_pessoais/components/transacao_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/chart.dart';
import 'components/transacao_lista.dart';
import 'models/transacao.dart';

void main() => runApp(const GastosApp());

class GastosApp extends StatelessWidget {
  const GastosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: tema.copyWith(
        primaryColor: Colors.purple,
        textTheme: GoogleFonts.pacificoTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: tema.colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber,
        ),
        appBarTheme: AppBarTheme(
          // titleTextStyle: const TextStyle(
          //   fontSize: 20,
          //   fontWeight: FontWeight.bold,
          // ),
          toolbarTextStyle: GoogleFonts.pacificoTextTheme(
            Theme.of(context).textTheme,
          ).bodyText2,
          titleTextStyle: GoogleFonts.pacificoTextTheme().headline6,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transacao> _transacao = [
    Transacao(
      id: 't0',
      titulo: 'Conta Inválida',
      valor: 31.75,
      data: DateTime.now().subtract(const Duration(days: 33)),
    ),
    Transacao(
      id: 't1',
      titulo: 'Novo Tenis de corrida',
      valor: 310.75,
      data: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transacao(
      id: 't2',
      titulo: 'Conta de Luz',
      valor: 210.56,
      data: DateTime.now().subtract(const Duration(days: 4)),
    ),
  ];

  List<Transacao> get _transacaoRecente {
    return _transacao.where(
      (element) {
        return element.data.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  _addTransacao(String titulo, double valor) {
    final novaTransacao = Transacao(
      id: Random().nextDouble().toString(),
      data: DateTime.now(),
      titulo: titulo,
      valor: valor,
    );

    setState(() {
      _transacao.add(novaTransacao);
    });

    Navigator.of(context).pop();
  }

  _opentransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransacaoForm(_addTransacao);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas Pessoais',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _opentransactionFormModal(context),
            color: Colors.purple,
          )
        ],
      ),
      body: ListView(
        children: [
          Chart(_transacaoRecente),
          TransacaoLista(transacao: _transacao),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _opentransactionFormModal(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
