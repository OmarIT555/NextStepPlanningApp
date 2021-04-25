import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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

  bool alphaRev = false;
  bool dateRev = false;
  bool diffRev = false;
  bool createdRev = false;
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
      floatingActionButton:  SpeedDial(
        animatedIcon: AnimatedIcons.menu_arrow,
        overlayColor: Colors.black,
        backgroundColor: Colors.green,
        animatedIconTheme: IconThemeData.fallback(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.autorenew),
            backgroundColor: Colors.deepPurpleAccent,
            label: 'Reverse Tasks',
            labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            onTap: () {
              setState(() {
                tasks = tasks.reversed.toList();
                saveData();
              });
            }
          ),
          SpeedDialChild(
              child: Icon(Icons.sort_by_alpha),
              backgroundColor: Colors.deepPurple,
              label: 'Sort Alphabetically',
              labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              onTap: () {
                setState(() {
                  if(alphaRev == true){
                    tasks.sort((a, b) => a.taskName.toLowerCase().compareTo(b.taskName.toLowerCase()));
                    tasks = tasks.reversed.toList();
                    alphaRev = false;
                  }
                  else {
                    tasks.sort((a, b) => a.taskName.toLowerCase().compareTo(b.taskName.toLowerCase()));
                    alphaRev = true;
                  }
                  saveData();
                });
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.color_lens_outlined),
              backgroundColor: Colors.purple,
              label: 'Sort by color',
              labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              onTap: () {
                setState(() {
                    tasks.sort((a, b) => a.taskColor.compareTo(b.taskColor));
                    tasks = tasks.reversed.toList();
                    saveData();
                });
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.date_range),
              backgroundColor: Colors.purpleAccent,
              label: 'Sort by due date',
              labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              onTap: () {
                setState(() {
                  if(dateRev == true){
                    tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
                    tasks = tasks.reversed.toList();
                    dateRev = false;
                  }
                  else {
                    tasks.sort((a, b) => a.dueDate.compareTo(b.dueDate));
                    dateRev = true;
                  }
                  saveData();
                });
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.assignment_late_outlined),
              backgroundColor: Colors.pinkAccent,
              label: 'Sort by difficulty',
              labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              onTap: () {
                setState(() {
                  if(diffRev == true){
                    tasks.sort((a, b) => a.taskDifficulty.compareTo(b.taskDifficulty));
                    tasks = tasks.reversed.toList();
                    diffRev = false;
                  }
                  else {
                    tasks.sort((a, b) => a.taskDifficulty.compareTo(b.taskDifficulty));
                    diffRev = true;
                  }
                  saveData();
                });
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.system_update_alt),
              backgroundColor: Colors.teal,
              label: 'Sort by created date',
              labelStyle: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              onTap: () {
                setState(() {
                  if(createdRev == false){
                    tasks.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));
                    tasks = tasks.reversed.toList();
                    createdRev = true;
                  }
                  else {
                    tasks.sort((a, b) => a.dateCreated.compareTo(b.dateCreated));
                    createdRev = false;
                  }
                  saveData();
                });
              }
          )


        ],
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
    if (tasks[index].taskDifficulty == "2High") {
      return Text("!!!",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
    } else if (tasks[index].taskDifficulty == "1Medium") {
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
      case 'brown':
        return Colors.brown;
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
