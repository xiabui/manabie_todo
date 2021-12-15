part of 'task_bloc.dart';

@immutable
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}

class TaskLoading extends TaskState {
  const TaskLoading();
}

class TaskLoaded extends TaskState {
  final List<TaskModel> data;
  const TaskLoaded(this.data);

  @override
  List<TaskModel> get props => data;
}

class TaskError extends TaskState {
  final String errorMessage;
  const TaskError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class TaskFinished extends TaskState {
  final int statusCode;
  const TaskFinished(this.statusCode);

  @override
  List<Object> get props => [statusCode];
}
