import 'package:flutter/material.dart';
import 'package:next_step_planning/task_details_screen.dart';

// This this the home screen. It contains all of the tasks the user have created.
class MyHomePage extends StatefulWidget {
  //MyHomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  int botNavBarIndex = 0;
  List tasks = List<String>.generate(0, (index) => null);

  List taskAssign() {
    tasks = List<String>.generate(count, (index) => "Task " + (index + 1).toString());
    return tasks;
  }




  // Widget currentScreen = listViewBuilder(0);

  // Used with the Floating Action Button (For now) Keeps track of how many times it's pressed
  void _incrementCounter() {
    setState(() {
      count++;
      tasks = taskAssign();
    });
  }

  //Builds The App
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
      ),
      body:

      Center(
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
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Dismissible(
          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key(task),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              tasks.removeAt(index);
            });

            // Show a snackbar. This snackbar could also contain "Undo" actions.
            Scaffold
                .of(context)
                .showSnackBar(SnackBar(content: Text("$tasks dismissed")));
          },
          child: ListTile(title: Text("Task " + (index + 1).toString()),
              subtitle: Text("Task is due by (insert date here)"),
            leading: Icon(Icons.assignment_outlined)),
        );
      },
    );
  }
}
