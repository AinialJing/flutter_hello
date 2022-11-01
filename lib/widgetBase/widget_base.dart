import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children:[
              const Text(
                '文本是视图中最常用的控件',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.redAccent),
              ),
              TextButton(onPressed: (){
                print('不要点我的啦');
              }, child: Text('按钮'))
            ],
          ),
        ),
      ),
    );
  }
}
