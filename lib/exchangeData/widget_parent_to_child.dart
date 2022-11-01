import 'dart:math';

import 'package:flutter/material.dart';

class WidgetParentToChild extends StatefulWidget {
  @override
  State<WidgetParentToChild> createState() => _WidgetParentToChildState();
}

class _WidgetParentToChildState extends State<WidgetParentToChild> {
  int _count=0;

  void _incrementCounter(){
    _count=Random().nextInt(100);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _incrementCounter();
          },
        ),
        body: Center(
          child: CountContainer(
            count: _count,
            child: CountContainerChild(),
          ),
        ),
      ),
    );
  }
}

class CountContainer extends InheritedWidget {
  final int count;

  CountContainer({
    required this.count,
    required Widget child}): super(child: child);

  @override
  bool updateShouldNotify(CountContainer oldWidget) => count != oldWidget.count;

  static CountContainer? of(BuildContext context) =>context.dependOnInheritedWidgetOfExactType();
}
class CountContainerChild extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
       final int number=CountContainer.of(context)!.count;
       return Text("$number", style: TextStyle(color: Colors.amber, fontSize: 40));
  }
}
