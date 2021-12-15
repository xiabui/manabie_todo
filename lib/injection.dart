
import 'package:get_it/get_it.dart';
import 'package:manabie_todo/src/data/datasource/local/task_database.dart';
import 'package:manabie_todo/src/data/repositories/task_repository_impl.dart';
import 'package:manabie_todo/src/domain/repositories/task_repository.dart';
import 'package:manabie_todo/src/domain/usecases/add_task_usecase.dart';
import 'package:manabie_todo/src/domain/usecases/delete_task_usecase.dart';
import 'package:manabie_todo/src/domain/usecases/get_tasks_usecase.dart';
import 'package:manabie_todo/src/domain/usecases/get_tasks_with_status_usecase.dart';
import 'package:manabie_todo/src/domain/usecases/update_task_usecase.dart';
import 'package:manabie_todo/src/presentation/blocs/task/task_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {

  injector.registerSingleton<TaskDatabase>(
    TaskDatabase(),
  );
  
  injector.registerSingleton<TaskRepository>(
    TaskRepositoryImplement(injector()),
  );

  injector.registerSingleton<GetTasksUseCase>(
    GetTasksUseCase(injector()),
  );

  injector.registerSingleton<GetTasksWithStatusUseCase>(
    GetTasksWithStatusUseCase(injector()),
  );

  injector.registerSingleton<AddTasksUseCase>(
    AddTasksUseCase(injector()),
  );

  injector.registerSingleton<UpdateTasksUseCase>(
    UpdateTasksUseCase(injector()),
  );

  injector.registerSingleton<DeleteTasksUseCase>(
    DeleteTasksUseCase(injector()),
  );

  injector.registerFactory<TaskBloc>(
    () => TaskBloc(injector(), injector(), injector(), injector(), injector()),
  );
}