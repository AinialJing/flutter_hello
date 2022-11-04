import 'package:flutter/material.dart';
import 'package:flutter_hello/main.dart';
import 'package:flutter_hello/navigator2/navigator2_second_page.dart';

import '../arguments.dart';
RouteObserver<ModalRoute<void>> routeObserver =
RouteObserver<ModalRoute<void>>();
class Navigator2HomePage extends StatefulWidget {
  @override
  State<Navigator2HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<Navigator2HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            child: Text('主页'),
            onTap: () {
              Arguments arguments = Arguments();
              arguments.name = "我是从主页面传的";
              arguments.age = 18;
              myRoutes.push(
                  widget: Navigator2SecondPage(), arguments: arguments);
            },
          ),
        ),
      ),
    );
  }
}
