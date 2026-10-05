import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/tarefa_provider.dart';
import 'pages/tarefas_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TarefaProvider(),
      child: const MeuAplicativo(),
    ),
  );
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha Rotina',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TarefasPage(),
    );
  }
}