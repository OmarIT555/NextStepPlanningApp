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
  int count = 0;
  int botNavBarIndex = 0;
  List tasks = List<String>.generate(0, (index) => null);

  void taskAssign(String taskName) {
        tasks.insert(0, taskName);
        print(tasks);
  }


  // Used with the Floating Action Button (For now) Keeps track of how many times it's pressed
  void _incrementCounter(String taskName) {
    setState(() {
      count++;
      taskAssign(taskName);
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
        child: listViewBuilder(count), //currentScreen //listViewBuilder(count),
        //TaskDetails(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        tooltip: 'Add Task',
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }

  // Increment number of task(s) and navigate to the TaskDetails class
  Future<void> addTask() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetails(),
      ));
    setState(() {
      String taskName = result;
      _incrementCounter(taskName);
    });
  }

  // Used for creating and removing tasks
  ListView listViewBuilder(int num) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Dismissible(
          key: Key(task),
          onDismissed: (direction) {
            // Remove the task and decreases the count
            setState(() {
              tasks.removeAt(index);
              count--;
            });

            // Message confirming the removal of a task
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Task removed")));
          },
          child: ListTile(
              title: Text(tasks[index]),
              subtitle: Text("Task is due by (insert date here)"),
              leading: Icon(Icons.assignment_outlined)),
        );
      },
    );
  }
}
