import 'package:despesas_pessoais/components/Transacao_usuario.dart';
import 'package:flutter/material.dart';

void main() => runApp(const GastosApp());

class GastosApp extends StatelessWidget {
  const GastosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: ListView(
        children: const [
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Text('Gráfico'),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          TransacaoUsuario(),
        ],
      ),
    );
  }
}
