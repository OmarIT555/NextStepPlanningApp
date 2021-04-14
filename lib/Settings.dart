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
        body:
        Center(
          child: Column(
            children: <Widget>[

              Align(
                alignment: Alignment.centerLeft,
                child: Text("  Themes                                                                                                                                                                                                                                                                                                ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, backgroundColor: Colors.green.shade700)),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(""),
              ),

              Align(
                alignment: Alignment.center,
                child:
                TextButton(
                    child: Text('Light Theme', style: TextStyle(color: Colors.green, fontSize: 20)),
                    onPressed: () =>
                    {
                      _themeChanger.setTheme(getTheme(0)),
                      //ThemePrefs().savePrefs(0),
                      //ThemePrefs().getThemeNumber()
                    }
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(""),
              ),

              Align(
                alignment: Alignment.center,
                child: TextButton(
                    child: Text('Dark Theme', style: TextStyle(color: Colors.green, fontSize: 20)),
                    onPressed: () =>
                    {
                      _themeChanger.setTheme(getTheme(1)),
                      //ThemePrefs().savePrefs(1),
                      //ThemePrefs().getThemeNumber()
                    }
                ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(""),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("  About                                                                                                                                                                                                                                                                                                ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, backgroundColor: Colors.green.shade700)),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(""),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("   About section here.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(""),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("  Help                                                                                                                                                                                                                                                                                                ",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, backgroundColor: Colors.green.shade700)),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("" ),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text("   Help section here.", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(""),
              ),

            ],
          ),
        )
    );
    //),
    //);
  }

}
