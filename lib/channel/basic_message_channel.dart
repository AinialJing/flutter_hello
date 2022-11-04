///使用window.defaultRouteName需要导入的包
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyBasicMessageChannel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => BasicMessageChannelHome(),
        'second': (BuildContext context) => BasicMessageChannelSecond()
      },
      home: _widgetForRoute(window.defaultRouteName),
    );
  }
}

Widget? _widgetForRoute(String route){
  switch(route){
    case "home":
      return BasicMessageChannelHome();
    case "second":
      return BasicMessageChannelSecond();
    default:
      return BasicMessageChannelHome();
  }
}

class BasicMessageChannelHome extends StatefulWidget {
  @override
  State<BasicMessageChannelHome> createState() =>
      BasicMessageChannelHomeState();
}

class BasicMessageChannelHomeState extends State<BasicMessageChannelHome> {
  var _basicMessage = BasicMessageChannel("BasicChannel", StringCodec());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            child: Text('发送BasicMessageChannel'),
            onTap: () {
              _basicMessage.send('JumpNativeActivity').then((value) {
                print(value);
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _basicMessage.setMessageHandler((message) async {
        print(message);
        return 'ACK FROM ART';
      });
    });
  }
}

class BasicMessageChannelSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Dart second page'),
        ),
      ),
    );
  }
}
