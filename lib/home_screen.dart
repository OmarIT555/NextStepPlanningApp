import 'package:flutter/material.dart';
import 'package:next_step_planning/Settings.dart';
import 'package:next_step_planning/task_details_screen.dart';

import 'Task.dart';

// This this the home screen. It contains all of the tasks the user have created.
class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int botNavBarIndex = 0;
  List tasks = List<Task>.generate(0, (index) => null);

  // Add new task to the list
  void taskAssign(Task task) {
    setState(() {
      tasks.insert(0, task);
      print(task.taskName);
      print(task.dueDate);
      print(task.taskDescription);
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
        taskAssign(task);
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
            });
            // Message confirming the removal of a task
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Task removed")));
          },
          child: ListTile(
              title: Text(tasks[index].taskName),
              subtitle: Text("Task is due by (${tasks[index].dueDate})"),
              leading: Icon(Icons.assignment_outlined)),
        );
      },
    );
  }
}
