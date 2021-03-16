import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sort extends StatefulWidget {
  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Sort Tasks")),
      body: Align(
        alignment: Alignment.center,
        child: Text("This page will sort all tasks",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800)),
      ),

    );
  }
}
