import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manabie_todo/injection.dart';
import 'package:manabie_todo/src/data/datasource/local/task_database.dart';
import 'package:manabie_todo/src/data/models/task_model.dart';
import 'package:manabie_todo/src/presentation/blocs/task/task_bloc.dart';
import 'package:manabie_todo/src/presentation/pages/all_task_page.dart';
import 'package:manabie_todo/src/presentation/pages/home_page.dart';

Widget createHomeScreen() {
  return BlocProvider<TaskBloc>(
    create: (context) => injector<TaskBloc>()..add(const GetAllTask()),
    child: const MaterialApp(
      home: Scaffold(body: AllTaskPage()),
    ),
  );
}

void addData() async {
  TaskDatabase database = TaskDatabase();
  List<TaskModel> tasksTest = [
    // TaskModel(title: 'Test nn', status: 1),
    // TaskModel(title: 'Test er', status: 1),
    TaskModel(title: 'Test rtpl', status: 2),
    // TaskModel(title: 'Test ty', status: 1),
    // TaskModel(title: 'Test yu', status: 1),
  ];

  for (int i = 0; i < tasksTest.length; i++) {
    await database.addTask(tasksTest[i]);
  }
}

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  // addData();

  group('Home Page Widget Tests', () {
    // BEGINNING OF NEW CONTENT
    testWidgets('ListView must be shown after loading circular disappear', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });
    // END OF NEW CONTENT

    testWidgets('Testing Scrolling on the all test', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pumpAndSettle();

      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(const ValueKey('task_item_1'));

      await tester.scrollUntilVisible(
        itemFinder,
        500.0,
        scrollable: listFinder,
      );

      expect(itemFinder, findsOneWidget);
    });

    testWidgets('Testing change the status of task', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      await tester.pumpAndSettle();

      final itemFinder = find.byKey(const Key('check_box')).first;
      final checkbox = tester.firstWidget(itemFinder) as Checkbox;
      final bool? currentStatus = checkbox.value;

      await tester.tap(itemFinder);
      await tester.pump();

      
      expect(currentStatus, checkbox.value);
    });

    testWidgets('Testing delete task', (tester) async {
      addData();
      await tester.pumpWidget(createHomeScreen());
      await tester.pumpAndSettle();

      var totalItems = tester.widgetList(find.byIcon(Icons.delete_forever_rounded)).length;
      await tester.tap(find.byIcon(Icons.delete_forever_rounded).first);
      await tester.pumpAndSettle();

      expect(tester.widgetList(find.byIcon(Icons.close)).length, lessThan(totalItems));
    });
  });
}
