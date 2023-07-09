import 'package:task_list_app/model/task.dart';
import 'package:task_list_app/service/network_service.dart';

class TasksRep {
  final NetworkService _networkService;

  TasksRep(this._networkService);

  Future<List<Task>> fetchAllTasks() async {
    return await _networkService.getTasks();
  }
}
