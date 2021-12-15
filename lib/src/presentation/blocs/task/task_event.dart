part of 'task_bloc.dart';

@immutable
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class GetAllTask extends TaskEvent {
  const GetAllTask();

  @override
  List<TaskModel> get props => [];
}

class GetTaskWithStatus extends TaskEvent {
  final int status;
  const GetTaskWithStatus(this.status);

  @override
  List<Object> get props => [status];
}

class AddTask extends TaskEvent {
  final TaskModel model;
  const AddTask(this.model);

  @override
  List<TaskModel> get props => [model];
}

class UpdateTask extends TaskEvent {
  final TaskModel model;
  const UpdateTask(this.model);

  @override
  List<TaskModel> get props => [model];
}

class DeleteTask extends TaskEvent {
  final int id;
  const DeleteTask(this.id);

  @override
  List<Object> get props => [id];
}