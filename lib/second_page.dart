import 'package:flutter/material.dart';
import 'package:flutter_hello/arguments.dart';
import 'package:flutter_hello/main.dart';
import 'package:flutter_hello/three_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    Arguments arguments =
        ModalRoute.of(context)?.settings.arguments as Arguments;
    String name = arguments.name;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('第二个页面'),
          centerTitle: true,
          leading: BackButton(
            onPressed: () {
              Arguments result = Arguments();
              result.name = "我是来源于第二个页面的数据";
              Navigator.pop(context, result);
              // Navigator.popUntil(context, (route) => false);
              // Navigator.popAndPushNamed(context, "three");
            },
          ),
        ),
        body: Center(
          child: MaterialButton(
            onPressed: () {
              // Navigator.pushNamed(context, "three");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyThreePage(),
                      settings: RouteSettings(name: 'three')));
            },
            child: Text(name),
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    super.initState();
  }

  @override
  void didPushNext() {
    print('SecondPage didPushNext');
  }

  @override
  void didPop() {
    print('SecondPage didPop');
  }

  @override
  void didPush() {
    print('SecondPage didPush');
  }

  @override
  void didPopNext() {
    print('SecondPage didPopNext');
  }
  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }
}
