import 'package:manabie_todo/src/core/usecase.dart';
import 'package:manabie_todo/src/data/models/task_model.dart';
import 'package:manabie_todo/src/domain/repositories/task_repository.dart';

class GetTasksUseCase implements UseCase<List<TaskModel>, void>{
  final TaskRepository _taskRepository;

  GetTasksUseCase(this._taskRepository);

  @override
  Future<List<TaskModel>> call({void params}) {
    return _taskRepository.getAllTasks();
  }
}