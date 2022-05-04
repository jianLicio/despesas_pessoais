import 'package:despesas_pessoais/components/transacao_item.dart';
import 'package:flutter/material.dart';
import '../models/transacao.dart';

class TransacaoLista extends StatelessWidget {
  const TransacaoLista(
      {Key? key, required this.transacao, required this.onRemove})
      : super(key: key);

  final List<Transacao> transacao;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return transacao.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Nenhuma Transação Cadastrada',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(constraints.maxHeight * 0.05)),
                SizedBox(
                  height: constraints.maxHeight * 0.2,
                  child: Image.asset(
                    'assets/imagens/wait.png',
                  ),
                ),
              ],
            );
          })
        : ListView(
            children: transacao.map((tr) {
              return TransacaoItem(
                key: ValueKey(tr.id),
                tr: tr,
                onRemove: onRemove,
              );
            }).toList(),
          );
    // ListView.builder(
    //     itemCount: transacao.length,
    //     itemBuilder: (ctx, index) {
    //       final tr = transacao[index];
    //       return Padding(
    //         padding: const EdgeInsets.all(5),
    //         child: TransacaoItem(tr: tr, onRemove: onRemove),
    //       );
    //     },
    //   );
  }
}
