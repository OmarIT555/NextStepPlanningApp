import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Next Step Planning',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:
      Scaffold(
        appBar: AppBar(title: Text("Next Step Planning")),
        body: MyHomePage(),
      ),
    );
  }
}


// Creates tasks
ListView listViewBuilder(int count){
  return ListView.builder(
    itemCount: count,
    itemBuilder: (_, index){
      return ListTile(
        title: Text("Task " + (index + 1).toString()),
          subtitle: Text("Task is due by (insert date here)"),
        leading: Icon(Icons.assignment_outlined),
      );
    },
  );
}


class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}


class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  // Used with the Floating Action Button (For now) Keeps track of how many times it's pressed
  void _incrementCounter() {
    setState(() {
      count++;
    });
  }

  //Builds The App
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasks"),
      ),
      body: Center(
        child:  listViewBuilder(count),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



}


