import 'dart:math';

import 'package:despesas_pessoais/components/transacao_form.dart';
import 'package:despesas_pessoais/components/transacao_lista.dart';
import 'package:flutter/material.dart';

import '../models/transacao.dart';

class TransacaoUsuario extends StatefulWidget {
  const TransacaoUsuario({Key? key}) : super(key: key);

  @override
  State<TransacaoUsuario> createState() => _TransacaoUsuarioState();
}

class _TransacaoUsuarioState extends State<TransacaoUsuario> {
  final _transacao = [
    Transacao(
      id: 't1',
      titulo: 'Novo Tenis de corrida',
      valor: 310.75,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't2',
      titulo: 'Conta de Luz',
      valor: 210.56,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't3',
      titulo: 'Conta de água',
      valor: 18.75,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't4',
      titulo: 'Conta de Internet',
      valor: 310.75,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't5',
      titulo: 'shoppe',
      valor: 10.75,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't6',
      titulo: 'Amazon Prime',
      valor: 10.75,
      data: DateTime.now(),
    ),
    Transacao(
      id: 't7',
      titulo: 'Netflix',
      valor: 42,
      data: DateTime.now(),
    ),
  ];

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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransacaoLista(transacao: _transacao),
        TransacaoForm(onSubmit: _addTransacao),
      ],
    );
  }
}
