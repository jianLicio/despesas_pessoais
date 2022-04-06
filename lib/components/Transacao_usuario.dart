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
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransacaoLista(transacao: _transacao),
        TransacaoForm(),
      ],
    );
  }
}
