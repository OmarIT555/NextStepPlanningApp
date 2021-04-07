import 'package:flutter/material.dart';

class MyCustomColorPicker extends StatefulWidget {
  final ValueSetter<String> callback;
  MyCustomColorPicker({this.callback});
  @override
  _MyCustomColorPickerState createState() => _MyCustomColorPickerState();
}

class _MyCustomColorPickerState extends State<MyCustomColorPicker> {
  bool isSubmitted = false;
  final checkBoxIcon = 'assets/checkbox.svg';

  String selectedColor = "";
  List<String> selectedCategory = new List<String>();
  String green = 'Green';
  String red = 'Red';
  String blue = 'Blue';
  String yellow = 'Yellow';
  String purple = 'Purple';


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 4.0,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(width: 2.0,),
                        InkWell(
                          onTap: (){
                            selectedCategory = new List<String>();
                            selectedCategory.add(green);
                            selectedColor = "green";
                            widget.callback(selectedColor);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(
                                width: 3,
                                color: selectedCategory.contains(green) ? Colors.grey[700] : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('  ',
                              style: TextStyle(color: Colors.grey[900], fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                        SizedBox(width: 2.0,),
                        InkWell(
                          onTap: (){
                            selectedCategory = new List<String>();
                            selectedCategory.add(red);
                            selectedColor = "red";
                            widget.callback(selectedColor);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(
                                width: 3,
                                color: selectedCategory.contains(red) ? Colors.grey[700] : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('  ',
                              style: TextStyle(color: Colors.grey[900], fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                        SizedBox(width: 2.0,),
                        InkWell(
                          onTap: (){
                            selectedCategory = new List<String>();
                            selectedCategory.add(blue);
                            selectedColor = "blue";
                            widget.callback(selectedColor);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(
                                width: 3,
                                color: selectedCategory.contains(blue) ? Colors.grey[700] : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('  ',
                              style: TextStyle(color: Colors.grey[900], fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                        SizedBox(width: 2.0,),
                        InkWell(
                          onTap: (){
                            selectedCategory = new List<String>();
                            selectedCategory.add(yellow);
                            selectedColor = "yellow";
                            widget.callback(selectedColor);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              border: Border.all(
                                width: 3,
                                color: selectedCategory.contains(yellow) ? Colors.grey[700] : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('  ',
                              style: TextStyle(color: Colors.grey[900], fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                        SizedBox(width: 2.0,),
                        InkWell(
                          splashColor: Colors.blue[100],
                          onTap: (){
                            selectedCategory = new List<String>();
                            selectedCategory.add(purple);
                            selectedColor = "purple";
                            widget.callback(selectedColor);
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              border: Border.all(
                                width: 3,
                                color: selectedCategory.contains(purple) ? Colors.grey[700] : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(48.0)),
                            ),
                            child: Text('  ',
                              style: TextStyle(color: Colors.grey[900], fontSize: 10.0, fontWeight: FontWeight.w500),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.0,)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
