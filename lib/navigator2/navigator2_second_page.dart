import 'package:flutter/material.dart';
import 'package:flutter_hello/main.dart';
import 'package:flutter_hello/navigator2/navigator2_three_page.dart';

class Navigator2SecondPage extends StatefulWidget {
  @override
  State<Navigator2SecondPage> createState() => _HomePageState();
}

class _HomePageState extends State<Navigator2SecondPage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              myRoutes.popRoute();
            },
          ),
        ),
        body: Center(
          child: GestureDetector(
            child: Text('第二页'),
            onTap: () {
              myRoutes.push(widget: Navigator2ThreePage());
            },
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
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
