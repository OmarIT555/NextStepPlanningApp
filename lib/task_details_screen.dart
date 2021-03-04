import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'theme.dart';

class TaskDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leadingWidth: 5,
          backgroundColor: Colors.white,
          title: Text(
            "Task Details",
            style: TextStyle(color: Colors.black),
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
        /*child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[],
        ),*/
        child: Column(
          children: <Widget>[
            TextButton(
                child: Text('Dark Theme'),
                onPressed: () => _themeChanger.setTheme(ThemeData.dark())),
            TextButton(
                child: Text('Light Theme'),
                onPressed: () => _themeChanger.setTheme(ThemeData.light().copyWith(accentColor: Colors.green, backgroundColor: Colors.amber, primaryColor: Colors.green))),
          ],
        ),
      ),
    );
  }

  //Navigate back to home screen
  void addTask(BuildContext context) {
    Navigator.pop(context);
  }
}
