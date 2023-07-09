import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/providers/task_provider.dart';
import 'package:task_list_app/repositories/tasks_repositories.dart';
import 'package:task_list_app/service/network_service.dart';

final _networkProvider = Provider<NetworkService>((ref) {
  return NetworkService();
});

final _tasksRepositoryProvider = Provider<TasksRep>((ref) {
  final _networkService = ref.watch(_networkProvider);
  return TasksRep(_networkService);
});

final alltasksProvider = FutureProvider.autoDispose((ref) async {
  final _tasksProvider = ref.watch(taskProvider);
  return await _tasksProvider.getAllTasks();
});

final taskProvider = Provider<TasksProvider>((ref) {
  final _taskRepository = ref.watch(_tasksRepositoryProvider);
  return TasksProvider(
    tasksRep: _taskRepository,
  );
});
