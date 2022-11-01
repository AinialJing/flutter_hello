import 'package:flutter/material.dart';
import 'package:flutter_hello/home_page.dart';
import 'package:flutter_hello/login_page.dart';
import 'package:flutter_hello/second_page.dart';
import 'package:flutter_hello/three_page.dart';
import 'package:flutter_hello/unknow_page.dart';

class PathRoutersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        'home': (context) => HomePage(),
        'second': (context) => SecondPage(),
        'three': (context) => MyThreePage()
      },
      initialRoute: 'home',
      onGenerateRoute: (RouteSettings settings) {
        print("RouteSettings:" + (settings.name.toString()));
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (BuildContext context) {
              return LoginPage();
            });
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (BuildContext context) {
          return UnknowPage();
        });
      },
      // home: HomePage(),
    );
  }
}
