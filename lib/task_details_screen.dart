  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:next_step_planning/db/database.dart';
  import 'Task.dart';
  import 'customColorPicker.dart';
  import 'package:intl/intl.dart';

  /***
   * his page is the Task Detail page under the + icon in the Home page on the bottom right.
   * This page will let you add the name of the task, set its due date, add any
   * color/ difficulty level and description (optional) and will let you save it
   * on the Home page after he user is done filling it out.
   */
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
          resizeToAvoidBottomInset : false,
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
                      primary: Colors.grey,
                    ),
                    child: Text("Cancel"),
                    onPressed: () {
                      cancelClick(context);
                    },
                  ),
                ),
              ]),
          body: SingleChildScrollView(
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
                                  primary: Colors.teal,
                                  surface: Colors.teal,
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
                      taskDifficulty = "0Low";
                    }else if(newIndex == 1){
                      taskDifficulty = "1Medium";
                    }else{
                      taskDifficulty = "2High";
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
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 3.0, right: 3.0, top: 40.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2E7D32),
                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0))
                    ),
                    child: Text("Save"),
                    onPressed: () {
                      saveClick(context);
                    },
                  ),
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
      task.dateCreated = DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now());
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
      }
      else{
        if (taskColor == null){
          taskColor = "green";
        }
        if (taskDifficulty == null){
          taskDifficulty = "0Low";
        }
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

