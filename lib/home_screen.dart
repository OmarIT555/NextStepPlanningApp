import 'package:flutter/material.dart';
import 'package:next_step_planning/task_details_screen.dart';

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

  // Widget currentScreen = listViewBuilder(0);

  // Used with the Floating Action Button (For now) Keeps track of how many times it's pressed
  void _incrementCounter() {
    setState(() {
      count++;
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
        child: Icon(Icons.add),
      ),
    );
  }

  // Increment number of task(s) and navigate to the TaskDetails class
  void addTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetails()),
    );
    _incrementCounter();
  }

  // Creates tasks
  ListView listViewBuilder(int count) {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text("Task " + (index + 1).toString()),
          subtitle: Text("Task is due by (insert date here)"),
          leading: Icon(Icons.assignment_outlined),
        );
      },
    );
  }
}
