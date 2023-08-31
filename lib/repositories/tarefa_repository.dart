import 'package:loginapp/model/tarefa_model.dart';

class TarefaRepository {
  final List<TarefaModel> _tarefas = [];

  Future<void> add(TarefaModel tarefa) async {
    await Future.delayed(const Duration(milliseconds: 20));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 20));
    _tarefas.where((tarefa) => tarefa.id == id).first.concluido = concluido;
  }

  Future<void> remover(String id) async {
    await Future.delayed(const Duration(milliseconds: 20));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.id == id).first);
  }

  Future<List<TarefaModel>> listar() async {
    await Future.delayed(const Duration(milliseconds: 20));
    return _tarefas;
  }

  Future<List<TarefaModel>> naoConcluida() async {
    await Future.delayed(const Duration(milliseconds: 20));
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }
}
