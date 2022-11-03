import 'package:flutter/material.dart';

class GlobalSingleInstance {
  ///单例写法1
  // GlobalSingleInstance._internal();
  //
  // factory GlobalSingleInstance() => _instance;
  //
  // static late final GlobalSingleInstance _instance = GlobalSingleInstance._internal();

  ///单例写法2
  factory GlobalSingleInstance() => _getShared();

  static GlobalSingleInstance get _instance => _getShared();
  static GlobalSingleInstance? instance;

  GlobalSingleInstance._internal() {
    // 初始化
  }

  static GlobalSingleInstance _getShared() {
    instance ??= GlobalSingleInstance._internal();
    return instance!;
  }

  int _gloableNum = 0;
  int get gloableNum => _gloableNum;

  set gloableNum(int value) {
    _gloableNum = value;
  }
}

class GloableSingleInstance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GloableSingleInstanceHome(),
    );
  }
}

class GloableSingleInstanceHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('下一页'),
          onTap: () {
            GlobalSingleInstance._instance.gloableNum = 20;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GloableSingleInstanceSecond()));
          },
        ),
      ),
    );
  }
}

class GloableSingleInstanceSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Text('当前数据：${GlobalSingleInstance._instance.gloableNum}'),
      ),
    );
  }
}
