import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_step_planning/home_screen.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

class TaskDetails extends StatelessWidget {
  final _textController = TextEditingController();
  String taskName;
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leadingWidth: 5,
          title: Text(
            "Task Details",
            style: TextStyle(),
          ),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, right: 5.0, left: 5.0),
              child: ElevatedButton(
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
             TextButton(
                 child: Text('Light Theme'),
                 onPressed: () => _themeChanger.setTheme(ThemeData.light().copyWith(
                   accentColor: Colors.green,
                   primaryColor: Colors.green,
                 ))),
             TextButton(
                 child: Text('Dark Theme'),
                 onPressed: () => _themeChanger.setTheme(ThemeData.dark().copyWith(
                     accentColor: Colors.green,
                     primaryColor: Colors.green))),
             TextField(
               onChanged: (name){
                 taskName = name;
               },
               controller: _textController,)
           ],
    ),
    )
    );
      //),
    //);
  }

  //Navigate back to home screen
  void addTask(BuildContext context) {
    // Navigator.pop(context);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MyHomePage(taskName : taskName)));
  }
}
