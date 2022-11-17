import 'package:flutter/material.dart';

class SingleChildRenderObjectWidgetPage extends StatefulWidget{
  @override
  State<SingleChildRenderObjectWidgetPage> createState() => _SingleChildRenderObjectWidgetPageState();
}

class _SingleChildRenderObjectWidgetPageState extends State<SingleChildRenderObjectWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.deepOrange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Align(
                  alignment:Alignment.center,
                  child: Text('Align',style: TextStyle(backgroundColor: Colors.green,color: Colors.black),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}