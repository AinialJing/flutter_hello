import 'dart:ui';

import 'package:flutter/material.dart';

/// 继承自MultiChildRenderObjectWidget的常用组件
///                             MultiChildRenderObjectWidget
///      ---------------------------------------------------------------------------------
///           |         |       |       |                 |                 |         |
///          Flex     Stack   Wrap    RichText  CustomMultiChildLayout    Flow     ListBody
///     -----------  ------
///       |     |       |
///     Column  Row IndexedStack
class MultiChildWidget extends StatefulWidget {
  @override
  State<MultiChildWidget> createState() => _MultiChildWidgetState();
}

class _MultiChildWidgetState extends State<MultiChildWidget> with SingleTickerProviderStateMixin{
  late AnimationController menuAnimation;

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQueryData.fromWindow(window).size.width,
          height: MediaQueryData.fromWindow(window).size.height,
          color: Colors.blueGrey,
          child: Column(
            children: [
              /*******************************************Column*****************************************************/
              Container(
                width: 300,
                height: 100,
                color: Colors.indigo,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Text('Column child1'),
                      Text('Column child2'),
                      Text('Column child3'),
                      Text('Column child4'),
                      Text('Column child5'),
                      Text('Column child6'),
                      Text('Column child7'),
                      Text('Column child8'),
                      Text('Column child9'),
                      Text('Column child10'),
                    ],
                  ),
                ),
              ),
              /*******************************************Row*****************************************************/
              Container(
                width: 300,
                height: 100,
                color: Colors.blue,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                       Container(
                        width: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        color: Colors.deepOrange,
                        child: const Text('Row child1'),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        color: Colors.deepOrange,
                        child: const Text('Row child2'),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        color: Colors.deepOrange,
                        child: const Text('Row child3'),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        color: Colors.deepOrange,
                        child: const Text('Row child4'),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        color: Colors.deepOrange,
                        child: const Text('Row child5'),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        color: Colors.deepOrange,
                        child: const Text('Row child6'),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        color: Colors.deepOrange,
                        child: const Text('Row child7'),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 10.0),
                        color: Colors.deepOrange,
                        child: const Text('Row child8'),
                      )
                    ],
                  ),
                ),
              ),
              /*******************************************Stack*****************************************************/
              Stack(
                alignment: Alignment.bottomCenter,
                textDirection: TextDirection.rtl,
                fit: StackFit.loose,
                children: [
                  Container(
                    width: 60,
                    height: 60,

                    ///decoration和color属性不能同时设置
                    decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        border: Border(
                            top: BorderSide(color: Colors.yellow),
                            bottom: BorderSide(color: Colors.yellow),
                            right: BorderSide(color: Colors.yellow),
                            left: BorderSide(color: Colors.yellow))),
                    child: const Text('1'),
                  ),
                  Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: Colors.deepOrange,
                          border: Border(
                              top: BorderSide(color: Colors.yellow),
                              bottom: BorderSide(color: Colors.yellow),
                              right: BorderSide(color: Colors.yellow),
                              left: BorderSide(color: Colors.yellow))),
                      child: const Text('2')),
                  Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.deepOrange,
                          border: Border(
                              top: BorderSide(color: Colors.yellow),
                              bottom: BorderSide(color: Colors.yellow),
                              right: BorderSide(color: Colors.yellow),
                              left: BorderSide(color: Colors.yellow))),
                      child: const Text('3')),
                ],
              ),
              /*******************************************Wrap*****************************************************/
              Container(
                width: 300,
                height: 130,
                decoration: const BoxDecoration(color: Colors.green),
                child: Wrap(
                  children: [
                    _wrapText('Wrap1'),
                    _wrapText('Wrap2'),
                    _wrapText('Wrap3'),
                    _wrapText('Wrap4'),
                    _wrapText('Wrap5'),
                  ],
                ),
              ),
              /*******************************************RichText*****************************************************/
              Container(
                child: RichText(
                  text: TextSpan(
                    text: 'Hello ',
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'bold',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: ' world!'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _wrapText(String s) {
    return Container(
      width: 80,
      height: 60,
      alignment: Alignment.center,
      margin: const EdgeInsetsDirectional.only(end: 5, bottom: 5),
      decoration: const BoxDecoration(color: Colors.amber),
      child: Text(
        '${s}',
        style: const TextStyle(color: Colors.deepOrange, fontSize: 12),
      ),
    );
  }
}

