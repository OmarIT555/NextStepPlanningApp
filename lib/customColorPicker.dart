import 'package:flutter/material.dart';

class MyCustomColorPicker extends StatefulWidget {

  @override
  _MyCustomColorPickerState createState() => _MyCustomColorPickerState();
}

class _MyCustomColorPickerState extends State<MyCustomColorPicker> {
  bool isSubmitted = false;
  final checkBoxIcon = 'assets/checkbox.svg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: CircleBorder(),
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: CircleBorder(),
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: CircleBorder(),
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  shape: CircleBorder(),
                ),
                onPressed: () {},
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  shape: CircleBorder(),
                ),
                onPressed: () {},
              ),
            ]

        )
      ],
    );
  }
}