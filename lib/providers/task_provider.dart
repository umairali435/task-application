import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/repositories/tasks_repositories.dart';

class TasksProvider {
  final TasksRep _tasksRep;

  TasksProvider({
    required TasksRep tasksRep,
  })  : _tasksRep = tasksRep,
        super();

  Future<List<Task>> getAllTasks() async {
    return await _tasksRep.fetchAllTasks();
  }
}
