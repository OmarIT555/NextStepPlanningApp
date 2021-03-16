import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_step_planning/home_screen.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

class TaskDetails extends StatelessWidget {
  // this allows us to access the TextField text
  TextEditingController textFieldController = TextEditingController();
  String taskName;
  // TaskDetails({Key key, @required this.taskName}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            leadingWidth: 5,
            automaticallyImplyLeading: false,
            title: Text(
              "Task Details",
              style: TextStyle(),
            ),
            actions: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, right: 5.0, left: 5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  child: Text("Save"),
                  onPressed: () {
                    addTask(context);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 15.0, bottom: 15.0, right: 5.0, left: 5.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                  ),
                  child: Text("Cancel"),
                  onPressed: () {
                    print("Cancel button was clicked");
                  },
                ),
              ),
            ]),
        body: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: textFieldController,
                onChanged: (name) {
                  taskName = name;
                },
              )
            ],
          ),
        ));
    //),
    //);
  }

  //Navigate back to home screen
  void addTask(BuildContext context) {
    taskName = textFieldController.text;
    print("This is task name" + taskName);
    Navigator.pop(context, taskName);
  }
}
