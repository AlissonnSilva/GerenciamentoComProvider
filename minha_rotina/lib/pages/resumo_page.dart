import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tarefa_provider.dart';

class ResumoPage extends StatelessWidget {
  const ResumoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TarefaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _itemResumo(
              'Total de tarefas',
              provider.totalTarefas,
            ),
            const SizedBox(height: 20),
            _itemResumo(
              'Tarefas concluídas',
              provider.tarefasConcluidas,
            ),
            const SizedBox(height: 20),
            _itemResumo(
              'Tarefas pendentes',
              provider.tarefasPendentes,
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemResumo(String titulo, int quantidade) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              quantidade.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}