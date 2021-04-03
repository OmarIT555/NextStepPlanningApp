import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../Task.dart';

class DataBase {
  static const String TABLE_TASK = "task";
  static const String COLUMN_ID = "id";
  static const String COLUMN_TASKNAME = "taskName";
  static const String COLUMN_DUEDATE = "dueDate";
  static const String COLUMN_COLOR = "color";
  static const String COLUMN_TASKDIFF = "taskDiff";
  static const String COLUMN_TASKDESC = "taskDESC";
  static const String COLUMN_TASKCREATED = "taskCREATED";

  DataBase._();
  static final DataBase db = DataBase._();

  Database _database;

  Future<Database> get database async {
    print("database getter called");

    if (_database != null) {
      return _database;
    }

    _database = await createDataBase();
    return _database;
  }

  Future<Database> createDataBase() async {
    String dbPath = await getDatabasesPath();
    
    return await openDatabase(
        join(dbPath, 'taskDB.db'),
        version: 1,
        onCreate: (Database database, int version) async {
        print("Creating task table");

        await database.execute(
          "CREATE TABLE $TABLE_TASK ("
              "$COLUMN_ID INTEGER PRIMARY KEY,"
              "$COLUMN_TASKNAME TEXT,"
              "$COLUMN_DUEDATE TEXT,"
              "$COLUMN_COLOR TEXT,"
              "$COLUMN_TASKDIFF TEXT,"
              "$COLUMN_TASKDESC TEXT,"
              "$COLUMN_TASKCREATED TEXT"
              ")",
        );
      },
    );
  }

  Future<List<Task>> getTasks() async {
    final db = await database;

    var tasks = await db.query(
      TABLE_TASK,
      columns: [COLUMN_ID, COLUMN_TASKNAME, COLUMN_DUEDATE, COLUMN_COLOR, COLUMN_TASKDIFF, COLUMN_TASKDESC]
    );

    List<Task> taskList = List<Task>();

    tasks.forEach((currentTask) {
      Task task = Task.fromMap(currentTask);

      taskList.add(task);
    });

    return taskList;
  }

  Future<Task> insert (Task task) async {
    final db = await database;
    task.id = await db.insert(TABLE_TASK, task.toMap());
    print(task.id);
    return task;
  }

  /*insertData(table, data) async {
    var connection = await DataBase.db;
    return await connection.insert(table, data);
  }*/

  /*readData(table, data) async {
    var connection = await DataBase.db;
    return await connection.query(table, data);
  }*/

  /*Future<Task> insert (Task task, data) async{
    final db = await database;
    task.id = await db.insert(TABLE_TASK, task.toMap());
    return task;
  }*/
}