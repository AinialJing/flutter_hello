import 'package:flutter/material.dart';
import 'package:flutter_hello/arguments.dart';

class ConstructHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('跳转下一页'),
          onTap: () {
            Arguments arguments = Arguments();
            arguments.name = "我是来源于首页";
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ConstructSecondPage(arguments)));
          },
        ),
      ),
    );
  }
}

class ConstructSecondPage extends StatelessWidget {
  Arguments arguments;

  ConstructSecondPage(this.arguments);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('${arguments.name}'),
        ),
      ),
    );
  }
}
