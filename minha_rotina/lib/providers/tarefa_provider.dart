import 'package:flutter/material.dart';
import '../models/tarefa.dart';

class TarefaProvider extends ChangeNotifier {
  final List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  void adicionarTarefa(String nome) {
    _tarefas.add(
      Tarefa(nome: nome),
    );

    notifyListeners();
  }

  void removerTarefa(int index) {
    _tarefas.removeAt(index);

    notifyListeners();
  }

  void alternarTarefa(int index) {
    _tarefas[index].concluida = !_tarefas[index].concluida;

    notifyListeners();
  }

  int get totalTarefas {
    return _tarefas.length;
  }

  int get tarefasConcluidas {
    return _tarefas.where((tarefa) => tarefa.concluida).length;
  }

  int get tarefasPendentes {
    return totalTarefas - tarefasConcluidas;
  }
}