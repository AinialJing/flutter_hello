import 'dart:async';

import 'package:flutter/material.dart';

class ThreadPage extends StatelessWidget{
  int num=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:const Text( '多定时器修改变量'),centerTitle: true,),
        body: Center(
          child: GestureDetector(
            onTap: (){
              Timer.periodic(const Duration(milliseconds: 100), (timer) {
                num+=1;
                print("timer1:${num}");
              });
              Timer.periodic(const Duration(milliseconds: 100), (timer) {
                num+=1;
                print("timer2:${num}");
              });
            },
            child: const Text('启动多个定时器'),
          ),
        ),
      ),
    );
  }
}