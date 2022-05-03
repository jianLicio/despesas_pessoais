import 'package:despesas_pessoais/components/chart_bar.dart';
import 'package:despesas_pessoais/models/transacao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transacao> transacaoRecente;

  // ignore: use_key_in_widget_constructors
  const Chart(this.transacaoRecente, {Key? key});

  List<Map<String, dynamic>> get grupoTransacao {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double somaTotal = 0.0;

      for (var i = 0; i < transacaoRecente.length; i++) {
        bool mesmoDia = transacaoRecente[i].data.day == weekDay.day;
        bool mesmoMes = transacaoRecente[i].data.month == weekDay.month;
        bool mesmoAno = transacaoRecente[i].data.year == weekDay.year;

        if (mesmoDia && mesmoMes && mesmoAno) {
          somaTotal += transacaoRecente[i].valor;
        }
      }
      return {
        'dia': DateFormat.E().format(weekDay)[0],
        'valor': somaTotal,
      };
    }).reversed.toList();
  }

  double get _weekTotalValue {
    return grupoTransacao.fold(0, (soma, item) => soma + item['valor']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: grupoTransacao.map(
            ((e) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  label: e['dia'].toString(),
                  valor: e['valor'],
                  porcentagem: ((e['valor']) /
                      (_weekTotalValue == 0 ? 1 : _weekTotalValue)),
                ),
              );
            }),
          ).toList(),
        ),
      ),
    );
  }
}
