import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customColorPicker.dart';

class TaskDetails extends StatelessWidget {
  // this allows us to access the TextField text
  TextEditingController textFieldController = TextEditingController();
  String taskName, dateCreated, dateDue, description;
  Color taskColor;
  bool isCompleted;
  List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
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
                    primary: Color(0xFF2E7D32),
                  ),
                  child: Text("Save"),
                  onPressed: () {
                    returnHome(context);
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
                    returnHome(context);
                  },
                ),
              ),
            ]),
        body: Center(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("TASK NAME:"),
              TextField(
                decoration: InputDecoration(
                  hintText: "Study, Clean up, etc.",
                ),
                controller: textFieldController,
                onChanged: (name) {
                  taskName = name;
                },
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text("DUE BY:"),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "(MM/DD/YYYY)",
                ),
                // controller: textFieldController,
                // onChanged: (name) {
                //   taskName = name;
                // },
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text("TASK COLOR:"),
              ),
              MyCustomColorPicker(),
              Container(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text("TASK DIFFICULTY:"),
              ),
              ToggleButtons(
                renderBorder: false,
                fillColor: Colors.grey,
                selectedColor: Colors.white,
                color: Colors.black,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text("Low"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text("Medium"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text("High"),
                  ),
                ],
                onPressed: (int index) {},
                isSelected: isSelected,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text("TASK DESCRIPTION:"),
              ),
              TextField(
                // controller: textFieldController,
                // onChanged: (name) {
                //   taskName = name;
                // },
              ),
            ],
          ),
        )));
  }

  //Navigate back to home screen
  void returnHome(BuildContext context) {
    taskName = textFieldController.text;
    Navigator.pop(context, taskName);
  }
}
