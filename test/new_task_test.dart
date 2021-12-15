import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/injection.dart';
import 'package:manabie_todo/src/data/datasource/local/task_database.dart';
import 'package:manabie_todo/src/presentation/blocs/task/task_bloc.dart';
import 'package:manabie_todo/src/presentation/pages/add_task_page.dart';

Widget createHomeScreen() {
  return BlocProvider<TaskBloc>(
    create: (context) => injector<TaskBloc>()..add(const GetAllTask()),
    child: const MaterialApp(
      home: Scaffold(body: AddTaskPage()),
    ),
  );
}

Future<int> getCountTasks() async {
  TaskDatabase database = TaskDatabase();
  final list = await database.getAllTask();
  return list.length;
}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  // addData();

  group('Add New Task Tests', () {
    // BEGINNING OF NEW CONTENT
    testWidgets('Add task with title and content', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pumpAndSettle();
      
      int currentTaskCount = await getCountTasks();

      await tester.enterText(find.byKey(const Key('input_title')), 'Test');
      await tester.enterText(find.byKey(const Key('input_content')), 'Content');

      await tester.tap(find.byIcon(Icons.save_outlined));
      await tester.pump();

      expect(await getCountTasks(), greaterThan(currentTaskCount));
      
    });
    // END OF NEW CONTENT

    testWidgets('Add task with title only', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pumpAndSettle();
      
      int currentTaskCount = await getCountTasks();

      await tester.enterText(find.byKey(const Key('input_title')), 'Test 2');
      // await tester.enterText(find.byKey(const Key('input_content')), 'Content');

      await tester.tap(find.byIcon(Icons.save_outlined));
      await tester.pump();

      expect(await getCountTasks(), greaterThan(currentTaskCount));
    });

    testWidgets('Add task with content only', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pumpAndSettle();
      
      int currentTaskCount = await getCountTasks();

      // await tester.enterText(find.byKey(const Key('input_title')), 'Test');
      await tester.enterText(find.byKey(const Key('input_content')), 'Content 3');

      await tester.tap(find.byIcon(Icons.save_outlined));
      await tester.pump();

      expect(await getCountTasks(), greaterThan(currentTaskCount));
    });
  });
}
