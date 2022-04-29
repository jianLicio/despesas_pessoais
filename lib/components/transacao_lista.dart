import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        : ListView.builder(
            itemCount: transacao.length,
            itemBuilder: (ctx, index) {
              final tr = transacao[index];
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 229, 22, 91),
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.valor}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(tr.titulo),
                    subtitle: Text(DateFormat('d MMM y').format(tr.data)),
                    trailing: MediaQuery.of(context).size.width > 400
                        ? TextButton(
                            onPressed: () => onRemove(tr.id),
                            child: Row(children: [
                              Icon(
                                Icons.delete,
                                color: Theme.of(context).errorColor,
                              ),
                              Text(
                                'Excluir',
                                style: TextStyle(
                                    color: Theme.of(context).errorColor),
                              ),
                            ]),
                          )
                        : IconButton(
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => onRemove(tr.id),
                          ),
                  ),
                ),
              );
            },
          );
  }
}
