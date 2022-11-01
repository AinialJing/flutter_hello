import 'package:flutter/material.dart';

class MyPageLife extends StatefulWidget {
  @override
  State<MyPageLife> createState() => _MyState();
}

class _MyState extends State<MyPageLife> {

  @override
  Widget build(BuildContext context) {
    print('build');
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('页面的生命周期'),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
  }
 @override
  void reassemble() {
    super.reassemble();
    print('reassemble');
  }
  @override
  void activate() {
    print('activate');
  }

  @override
  void didUpdateWidget(covariant MyPageLife oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    print('deactivate');
  }

  @override
  void dispose() {
    print('dispose');
  }
}
