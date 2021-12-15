import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manabie_todo/injection.dart';
import 'package:manabie_todo/src/presentation/blocs/task/task_bloc.dart';
import 'package:manabie_todo/src/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TaskBloc>(
          create: (context) => injector<TaskBloc>()..add(const GetAllTask()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Manabie Todo',
      home: HomePage(),
    );
  }
}
