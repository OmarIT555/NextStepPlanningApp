import 'package:flutter/material.dart';
import 'package:next_step_planning/Settings.dart';
import 'package:next_step_planning/db/database.dart';
import 'package:next_step_planning/task_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'Task.dart';

// This this the home screen. It contains all of the tasks the user have created.
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //int botNavBarIndex = 0;
  List<Task> tasks = List<Task>.generate(0, (index) => null);

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    initSharedPreferences();
    super.initState();

    // Attempting to get all tasks stored in the database
    //DataBase.db.getTasks().then((taskList) => tasks);

    // SQFlite database debug
    //print("Printing DataBase");
    //print(DataBase.db.getTasks());

    // Trying to see if list of tasks got placed into the database
    //print("Printing List tasks");
    //print(tasks);
  }

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  // Add new task to the list
  void taskAssign(Task task) {
    setState(() {
      tasks.insert(0, task);
      //DataBase.db.insert(task);
      print(task.taskName);
      print(task.dueDate);
      print(task.taskDescription);
      print("Task name, date, and description set for void taskAssign");
      saveData();
    });
  }

  //Builds The App
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
      ),
      body: Center(
        child: listViewBuilder(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        tooltip: 'Add Task',
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }

  // Navigate to the TaskDetails class and add new task to the list of task(s)
  Future<void> addTask() async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskDetails(),
        ));
    setState(() {
      print(result);
      Task task = result;
      if (task != null) {
        // if task return not null add to list
        taskAssign(task);
        saveData();
      }
    });
  }

  // Used for creating and removing tasks
  ListView listViewBuilder() {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Dismissible(
            key: Key(task.taskName),
            onDismissed: (direction) {
              // Remove the task and decreases the count
              setState(() {
                tasks.removeAt(index);
                saveData();
              });
              // Message confirming the removal of a task
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Task removed")));
            },
            child: Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: showTaskColor(index),   // task border color
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text(tasks[index].taskName),
                  subtitle: Text("Task is due by (${tasks[index].dueDate})\nDescription: ${tasks[index].taskDescription}"),
                  leading: Icon(Icons.assignment_outlined),
                  trailing: showTaskDifficulty(index),
                )));
      },
    );
  }

  Text showTaskDifficulty(int index) {
    if (tasks[index].taskDifficulty == "High") {
      return Text("!!!",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
    } else if (tasks[index].taskDifficulty == "Medium") {
      return Text("!!",
          style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold));
    } else {
      return Text("!",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold));
    }
  }

  Color showTaskColor(int index){
    print("task color");
    print(tasks[index].taskColor);
    switch(tasks[index].taskColor)
    {
      case 'green':
        return Colors.green;
        break;
      case 'red':
        return Colors.red;
        break;
      case 'blue':
        return Colors.blue;
        break;
      case 'yellow':
        return Colors.yellow;
        break;
      case 'purple':
        return Colors.purple;
        break;
      default:
        return Colors.white;
    }
  }

  void saveData() {
    List<String> spList = tasks.map((e) => json.encode(e.toMap2())).toList();
    sharedPreferences.setStringList('tasks', spList);
    print(spList);
    print("Data Saved :D");
  }

  void loadData() {
    List<String> spList = sharedPreferences.getStringList('tasks');
    tasks = spList.map((e) => Task.fromMap2(json.decode(e))).toList();
    setState(() {});
    print("Data Loaded :D");
  }
}
