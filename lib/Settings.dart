  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
  import 'package:next_step_planning/home_screen.dart';
  import 'package:provider/provider.dart';
  import 'theme.dart';

  class Settings extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
      return Scaffold(
          appBar: AppBar(title: Text("Settings")),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "  Themes                                                                                                                                                                                                                                                                                                ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          backgroundColor: Colors.green.shade700)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(""),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      child: Text('Light Theme',
                          style: TextStyle(color: Colors.green, fontSize: 20)),
                      onPressed: () => {
                        _themeChanger.setTheme(getTheme(0)),
                        //ThemePrefs().savePrefs(0),
                        //ThemePrefs().getThemeNumber()
                      }),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(""),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      child: Text('Dark Theme',
                          style: TextStyle(color: Colors.green, fontSize: 20)),
                      onPressed: () => {
                        _themeChanger.setTheme(getTheme(1)),
                        //ThemePrefs().savePrefs(1),
                        //ThemePrefs().getThemeNumber()
                      }),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(""),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "  About                                                                                                                                                                                                                                                                                                ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          backgroundColor: Colors.green.shade700)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(""),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text("Version 1.0.0\n"
                          "\nNext Step Planning App helps you manage and organize your schedule by allowing you to create, sort and delete tasks. Unlike other planning apps, NSP app allows you to create an infinite number of tasks for FREE! NSP app also provides a simple yet responsive and interactive interface that’s easy to use.\n"
                          "\nFeatures:\n"
                          "-	Add tasks\n"
                          "-	Delete tasks\n"
                          "-	Sort tasks\n"
                          "-	Add task details\n"
                          "-	Dark/Light mode\n",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    )),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(""),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "  Help                                                                                                                                                                                                                                                                                                ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          backgroundColor: Colors.green.shade700)),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(""),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text("How NSP App works:\n"
                        "\n- Add Tasks: To add a task, navigate to Home page and click on the + icon at the bottom right. Enter your task details and click save. Your task should now be in your home screen.\n"
                        "\n- Delete Tasks: It's pretty simple. Just swipe LEFT to delete.\n"
                        "\n- Sort Tasks: To sort any task, navigate to the Sort Page located at the bottom of the App Bar. Then, click on the hamburger pop up menu on the bottom right and pick how you want to sort your tasks.\n",

                        style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  ),),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(""),
                ),
              ],
            ),
          ));
      //),
      //);
    }
  }
