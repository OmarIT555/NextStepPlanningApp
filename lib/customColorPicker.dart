import 'package:flutter/material.dart';

class MyCustomColorPicker extends StatefulWidget {
  @override
  _MyCustomColorPickerState createState() => _MyCustomColorPickerState();
}

class _MyCustomColorPickerState extends State<MyCustomColorPicker> {
  bool isSubmitted = false;
  final checkBoxIcon = 'assets/checkbox.svg';

  List<String> selectedCategory = new List<String>();
  String green = 'green';
  String red = 'red';
  String blue = 'blue';
  String yellow = 'yellow';
  String purple = 'purple';

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
