import 'package:flutter/material.dart';

class Navigator2ThreePage extends StatefulWidget{
  @override
  State<Navigator2ThreePage> createState() =>_ThreePageState();

}

class _ThreePageState extends State<Navigator2ThreePage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('页面三'),
        ),
      ),
    );
  }

}