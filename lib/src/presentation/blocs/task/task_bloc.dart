import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:manabie_todo/src/data/models/task_model.dart';
import 'package:manabie_todo/src/domain/usecases/add_task_usecase.dart';
import 'package:manabie_todo/src/domain/usecases/delete_task_usecase.dart';
import 'package:manabie_todo/src/domain/usecases/get_tasks_usecase.dart';
import 'package:manabie_todo/src/domain/usecases/get_tasks_with_status_usecase.dart';
import 'package:manabie_todo/src/domain/usecases/update_task_usecase.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(
    this._getTasksUseCase,
    this._getTasksWithStatusUseCase,
    this._addTasksUseCase,
    this._updateTasksUseCase,
    this._deleteTasksUseCase,
  ) : super(const TaskLoading()) {
    on<GetAllTask>(_loadAllTasks);
    on<GetTaskWithStatus>(_loadTasksWithStatus);
    on<AddTask>(_addTask);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
  }

  final GetTasksUseCase _getTasksUseCase;
  final GetTasksWithStatusUseCase _getTasksWithStatusUseCase;
  final AddTasksUseCase _addTasksUseCase;
  final UpdateTasksUseCase _updateTasksUseCase;
  final DeleteTasksUseCase _deleteTasksUseCase;

  void _addTask(AddTask event, Emitter<TaskState> emit) async {
    await _addTasksUseCase(params: event.model);
    final data = await _getTasksUseCase();
    emit(TaskLoaded(data));
  }

  void _updateTask(UpdateTask event, Emitter<TaskState> emit) async {
    final statusCode = await _updateTasksUseCase(params: event.model);

    if (statusCode == 1) {
      final data = await _getTasksUseCase();
      emit(TaskLoaded(data));
    } else {
      emit(const TaskError('Something happended when update task'));
    }
  }

  void _deleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    final statusCode = await _deleteTasksUseCase(params: event.id);

    if (statusCode == 1) {
      final data = await _getTasksUseCase();
      emit(TaskLoaded(data));
    } else {
      emit(const TaskError('Something happended when add new task'));
    }
  }

  void _loadTasksWithStatus(
      GetTaskWithStatus event, Emitter<TaskState> emit) async {
    final data = await _getTasksWithStatusUseCase(params: event.status);
    emit(TaskLoaded(data));
  }

  void _loadAllTasks(GetAllTask event, Emitter<TaskState> emit) async {
    final data = await _getTasksUseCase();
    emit(TaskLoaded(data));
  }
}
