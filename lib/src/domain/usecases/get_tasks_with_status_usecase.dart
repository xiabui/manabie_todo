import 'package:manabie_todo/src/core/usecase.dart';
import 'package:manabie_todo/src/data/models/task_model.dart';
import 'package:manabie_todo/src/domain/repositories/task_repository.dart';

class GetTasksWithStatusUseCase implements UseCase<List<TaskModel>, int>{
  final TaskRepository _taskRepository;

  GetTasksWithStatusUseCase(this._taskRepository);

  @override
  Future<List<TaskModel>> call({required int params}) {
    return _taskRepository.getTasksByStatus(params);
  }
}