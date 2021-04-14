import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:next_step_planning/db/database.dart';
import 'Task.dart';
import 'customColorPicker.dart';
import 'package:intl/intl.dart';

class TaskDetails extends StatelessWidget {
  // Access the TextField texts
  var nameController = TextEditingController();
  var dateController = TextEditingController();
  var descriptionController = TextEditingController();

  String taskName, dateCreated, dueDate, taskDescription, taskDifficulty, taskColor;
  bool isCompleted;
  List<bool> isSelected = [true, false, false];
  final DateFormat dateFormatter = DateFormat('MM-dd-yyyy');

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState){
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
                    saveClick(context);
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
                    cancelClick(context);
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
              Text("TASK NAME:"),                               //Task name
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Study, Clean up, etc.",
                ),
                controller: nameController,
                onChanged: (name) {
                  taskName = name;
                },
              ),
              Container(                                        //Due by
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text("DUE BY:"),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: dateController,
                onChanged: (date) {
                  dueDate = date;
                },
                decoration: InputDecoration(
                  hintText: "(MM-DD-YYYY)",
                  suffixIcon: IconButton(
                    onPressed: (){
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2030),
                        builder: (BuildContext context, Widget child) {
                            return Theme(
                                data: ThemeData.dark().copyWith(
                                colorScheme: ColorScheme.dark(
                                primary: Colors.green,
                                surface: Colors.green,
                              ),
                            ),
                              child: child,
                            );
                        }
                      ).then((date) => setState((){
                        dateController.text = dateFormatter.format(date).toString();
                      }));
                      },
                    icon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
              Container(                                         //Task Color
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text("TASK COLOR:"),
              ),
              MyCustomColorPicker(callback: (selectedColor){
                taskColor = selectedColor;
              }),
              Container(                                        //Task difficulty
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Text("TASK DIFFICULTY:"),
              ),
              ToggleButtons(
                isSelected: isSelected,
                renderBorder: false,
                fillColor: Colors.grey,
                selectedColor: Colors.white,
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text("Low (!)"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text("Medium (!!)"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text("High (!!!)"),
                  ),
                ],
                onPressed: (int newIndex) {    // task difficulty selection
                  setState((){
                    for (int index = 0; index < isSelected.length; index++){
                      if(index == newIndex){
                        isSelected[index] = true;
                      }else{
                        isSelected[index] = false;
                      }
                    }
                  });
                  if(newIndex == 0){
                    taskDifficulty = "Low";
                  }else if(newIndex == 1){
                    taskDifficulty = "Medium";
                  }else{
                    taskDifficulty = "High";
                  }
                },
              ),
              Container(                                        //Task Description
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text("TASK DESCRIPTION:"),
              ),
              TextField(
                controller: descriptionController,
                onChanged: (description) {
                  taskDescription = description;
                },
              ),
            ],
          ),
        )));
  });
  }

  //Navigate back to home screen
  void saveClick(BuildContext context) {
    if(validateInput(context) == true){
      Navigator.pop(context, createTask());
    }
  }

  Task createTask(){
    taskName = nameController.text;
    dueDate = dateController.text;
    taskDescription = descriptionController.text;

    var task = Task();  // task object to pass back to home page

    task.taskName = taskName;
    task.dueDate = dueDate;
    task.taskDescription = taskDescription;
    task.taskDifficulty = taskDifficulty;
    task.taskColor = taskColor;

    //DataBase.db.insert(task); // Was attempting to save the task in the database

    //!!! Validate task before returning !!!
    return task;
  }

  void cancelClick(BuildContext context) {
    Navigator.pop(context, null);
  }

  bool validateInput(BuildContext context){
    if (taskName == null){
      showAlertDialog(context);  // pop up dialog with invalid message
      return false;
    }else{
      return true;
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Uh Oh!"),
      content: Text("Task name cannot be empty."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

