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
    return SizedBox(
      height: 400,
      child: transacao.isEmpty
          ? Column(
              children: [
                const Text(
                  'Nenhuma Transação Cadastrada',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Image.asset(
                  'assets/imagens/wait.png',
                  scale: 0.6,
                ),
              ],
            )
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
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => onRemove(tr.id),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
