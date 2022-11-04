import 'dart:async';
import 'dart:math';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

EventBus eventBus = EventBus();

class ShareDataWithEventBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyFirstPage(),
    );
  }
}

class CustomEvent {
  String msg;

  CustomEvent(this.msg);
}

class MyFirstPage extends StatefulWidget {
  @override
  State<MyFirstPage> createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  late StreamSubscription<CustomEvent> subscription;
  String _msg="";

  @override
  void initState() {
    super.initState();
    subscription = eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        _msg = event.msg;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '$_msg',
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => MySecondPage()));
        },
      ),
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

class MySecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('使用Event bus'),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
              eventBus.fire(CustomEvent('总线发射${Random().nextInt(100)}'));
            },
          ),
        ),
        body: Text('我是第二个页面'),
      ),
    );
  }
}
