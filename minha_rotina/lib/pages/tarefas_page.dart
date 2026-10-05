import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tarefa_provider.dart';
import 'resumo_page.dart';

class TarefasPage extends StatelessWidget {
  const TarefasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TarefaProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ResumoPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: provider.tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = provider.tarefas[index];

          return ListTile(
            leading: Checkbox(
              value: tarefa.concluida,
              onChanged: (_) {
                provider.alternarTarefa(index);
              },
            ),
            title: Text(
              tarefa.nome,
              style: TextStyle(
                decoration: tarefa.concluida
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                provider.removerTarefa(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _mostrarDialogoAdicionar(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _mostrarDialogoAdicionar(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nova tarefa'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Nome da tarefa',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  Provider.of<TarefaProvider>(
                    context,
                    listen: false,
                  ).adicionarTarefa(controller.text);

                  Navigator.pop(context);
                }
              },
              child: const Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }
}