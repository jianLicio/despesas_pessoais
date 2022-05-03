import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transacao.dart';

class TransacaoItem extends StatelessWidget {
  final Transacao tr;
  final void Function(String p1) onRemove;

  const TransacaoItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                ]),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => onRemove(tr.id),
              ),
      ),
    );
  }
}
