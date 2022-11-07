import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterEventChannel extends StatefulWidget{
  @override
  State<FlutterEventChannel> createState() => _FlutterEventChannelState();
}

class _FlutterEventChannelState extends State<FlutterEventChannel> {
  EventChannel eventChannel=EventChannel('getNetworkState');
  String networkState="";

  StreamSubscription? subscription;
  @override
  void initState() {
    super.initState();
    subscription=eventChannel.receiveBroadcastStream().listen((event) {
      _handleEvent(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription!.cancel();
  }

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
         body: Center(
           child: Text('使用EventChannel:${networkState}'),
         ),
       ),
     );
  }

  void _handleEvent(int event) {
    setState(() {
      if(event==0){
        networkState="网络断开";
      }else{
        networkState="网络连接";
      }
    });
  }
}