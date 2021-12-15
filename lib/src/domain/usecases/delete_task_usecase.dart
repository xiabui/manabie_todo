import 'package:manabie_todo/src/core/usecase.dart';
import 'package:manabie_todo/src/domain/repositories/task_repository.dart';

class DeleteTasksUseCase implements UseCase<int, int>{
  final TaskRepository _taskRepository;

  DeleteTasksUseCase(this._taskRepository);

  @override
  Future<int> call({required int params}) {
    return _taskRepository.deleteTask(params);
  }
}