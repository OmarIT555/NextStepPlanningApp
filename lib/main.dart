import 'package:flutter/material.dart';
import 'package:next_step_planning/task_details_screen.dart';
import 'package:next_step_planning/theme.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light().copyWith(accentColor: Colors.green, primaryColor: Colors.green)),
      child: new MaterialAppWithTheme(),
    );
  }
}
class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Next Step Planning")),
        body: MyHomePage(),
      ),
      theme: theme.getTheme(),
    );
  }
}


