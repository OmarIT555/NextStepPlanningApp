import 'package:flutter/material.dart';
import 'package:next_step_planning/Sort.dart';
import 'package:next_step_planning/task_details_screen.dart';
import 'package:next_step_planning/theme.dart';
import 'package:provider/provider.dart';
import 'Settings.dart';
import 'home_screen.dart';
import 'Sort.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

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
        home: NSP_NavigationBar(),
        theme: theme.getTheme(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.green,
      height: preferredSize.height,
      child: new Center(
        child: new Text("Next Step Planning",
            style: TextStyle(color: Colors.white,fontSize: 19,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.italic),
      ),
    ));
    throw UnimplementedError();
  }

  @override
  Size get preferredSize => const Size.fromHeight(25.0);

}

class NSP_NavigationBar extends StatefulWidget {
  @override
  _NSP_NavigationBarState createState() => _NSP_NavigationBarState();
}

class _NSP_NavigationBarState extends State<NSP_NavigationBar> {
  int _navigationIndex = 0;
  final List<Widget> _pages = [
    MyHomePage(),
    Sort(), //Temporary page
    Settings()];

  void currentNavBar (int index) {
    setState(() {
      _navigationIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        /*appBar: AppBar(
            centerTitle: true,
            title: Text(
            "Next Step Planning",
            style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic
            ))),*/
        appBar: CustomAppBar(),

        body: _pages[_navigationIndex],

        bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,
                                                 backgroundColor: Colors.green,
                                                 selectedItemColor: Colors.white,
                                                 unselectedItemColor: Colors.white,
          onTap: currentNavBar,
          currentIndex: _navigationIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.sort), label: 'Sort'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          /*,*/
        )

    );
  }
}



