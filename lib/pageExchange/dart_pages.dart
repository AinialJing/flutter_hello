import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DartPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => DartHomePage(),
        'second': (BuildContext context) => DartSecondPage(),
      },
      home: _widgetForRoute(window.defaultRouteName),
    );
  }
}

class DartHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('欢迎来到Dart主页'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MethodChannel methodChannel=const MethodChannel("nativeCall");
          methodChannel.invokeMethod("toSecondActivity");
        },
        child: const Text('跳转'),
      ),
    );
  }
}

class DartSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('欢迎来到Dart第二页'),
      ),
    );
  }
}

Widget? _widgetForRoute(String route){
  switch(route){
    case "home":
      return DartHomePage();
    case "second":
      return DartSecondPage();
    default:
      return DartHomePage();
  }
}
