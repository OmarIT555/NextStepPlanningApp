import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_step_planning/task_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Task.dart';

class Sort extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MySortPageState();
  }
}

class _MySortPageState extends State<Sort> {
  //int botNavBarIndex = 0;
  List<Task> tasks = List<Task>.generate(0, (index) => null);
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  //Builds The App
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sorting"),
      ),
      body: Center(
        child: listViewBuilder(tasks.length),
      ),
    );
  }

  // Creates tasks that the user sees
  ListView listViewBuilder(int count){
    return ListView.builder(
      itemCount: count,
      itemBuilder: (_, index){
        final task = tasks[index];
        return ListTile(
            key: Key(task.taskName),
            title: Container(
                decoration: new BoxDecoration(
                  border: Border.all(
                    color: showTaskColor(index),   // task border color
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.fromLTRB(0, 1.5, 0, 1.5),
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
