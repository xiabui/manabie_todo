import 'package:manabie_todo/src/core/usecase.dart';
import 'package:manabie_todo/src/data/models/task_model.dart';
import 'package:manabie_todo/src/domain/repositories/task_repository.dart';

class AddTasksUseCase implements UseCase<int, TaskModel>{
  final TaskRepository _taskRepository;

  AddTasksUseCase(this._taskRepository);

  @override
  Future<int> call({required TaskModel params}) {
    return _taskRepository.addTask(params);
  }
}