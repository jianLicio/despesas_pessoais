import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transacao.dart';

class TransacaoItem extends StatefulWidget {
  final Transacao tr;
  final void Function(String p1) onRemove;

  const TransacaoItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  @override
  State<TransacaoItem> createState() => _TransacaoItemState();
}

class _TransacaoItemState extends State<TransacaoItem> {
  List<MaterialColor> cores = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];

  Color? _corFundo;

  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    _corFundo = cores[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 237, 21, 93),
          // backgroundColor: _corFundo,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                'R\$${widget.tr.valor}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(widget.tr.titulo),
        subtitle: Text(DateFormat('d MMM y').format(widget.tr.data)),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton(
                onPressed: () => widget.onRemove(widget.tr.id),
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
                onPressed: () => widget.onRemove(widget.tr.id),
              ),
      ),
    );
  }
}
