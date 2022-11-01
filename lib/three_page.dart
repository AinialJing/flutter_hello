import 'package:flutter/material.dart';
import 'package:flutter_hello/second_page.dart';

class MyThreePage extends StatelessWidget {
  const MyThreePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('页面三'),
          centerTitle: true,
          // leading: BackButton(
          //   onPressed: () {
          //     Navigator.popUntil(context,(Route router) => router.settings.name == "/");
          //   },
          // ),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                  (Route router) => router.settings.name == "/");
            },
            child: const Text('第三个页面，跳转到首页'),
          ),
        ),
      ),
    );
  }
}
