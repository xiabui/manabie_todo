import 'package:manabie_todo/src/data/datasource/local/task_dao.dart';
import 'package:manabie_todo/src/data/models/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TaskDatabase implements TaskDao {
  Future<Database> init() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'manabie_todo.db'),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE task(
            id INTEGER PRIMARY KEY,
            title TEXT,
            content TEXT,
            status INTEGER,
            end INTEGER,
            modified INTEGER
          )''',
        );
      },
      version: 1,
    );
  }

  @override
  Future<List<TaskModel>> getAllTask() async {
    final db = await init();
    final List<Map<String, dynamic>> maps = await db.query("task");

    List<TaskModel>? result = List.generate(maps.length, (index) {
      return TaskModel(
        id: maps[index]['id'],
        title: maps[index]['title'],
        content: maps[index]['content'],
        status: maps[index]['status'],
        endDate: maps[index]['end'],
        modified: maps[index]['modified'],
      );
    });

    if(result == null) return [];
    
    result.sort((TaskModel a, TaskModel b) => a.compareTo(b));

    return result;
  }

  @override
  Future<List<TaskModel>> getTaskWithStatus(int status) async {
    final db = await init();
    final List<Map<String, dynamic>> maps = await db.query(
      'task',
      where: 'status = ?',
      whereArgs: [status],
    );

    List<TaskModel> result = List.generate(maps.length, (index) {
      return TaskModel(
        id: maps[index]['id'],
        title: maps[index]['title'],
        content: maps[index]['content'],
        status: maps[index]['status'],
        endDate: maps[index]['end'],
        modified: maps[index]['modified'],
      );
    });
    
    result.sort((a, b) => a.modified!.compareTo(b.modified!));

    return result;
  }

  @override
  Future<int> addTask(TaskModel model) async {
    final db = await init();

    return db.insert(
      'task',
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  @override
  Future<int> updateTask(TaskModel model) async {
    final db = await init();

    return db.update(
      'task',
      model.toMap(),
      where: 'id = ?',
      whereArgs: [model.id],
    );
  }

  @override
  Future<int> deleteTask(int id) async {
    final db = await init();

    return db.delete(
      'task',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
