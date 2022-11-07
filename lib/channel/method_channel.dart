import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterMethodChannel extends StatelessWidget {
  MethodChannel methodChannel = MethodChannel('nativeCall');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            _callNativeMethod();
          },
          child: Center(
            child: Text('调用Native方法'),
          ),
        ),
      ),
    );
  }

  void _callNativeMethod() async {
    try {
      methodChannel.invokeMethod('nativeMethod');
    } catch (e) {
      print(e);
    }
  }
}
