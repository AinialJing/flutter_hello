import 'package:flutter/material.dart';
import 'package:flutter_hello/arguments.dart';
import 'package:flutter_hello/main.dart';
import 'package:flutter_hello/second_page.dart';

Arguments result = Arguments();

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      routes: {
        'home':(context)=>HomePage(),
        'second':(context) =>SecondPage()
      },
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: Center(
          child: MaterialButton(
              onPressed: () {
                Arguments arguments = Arguments();
                arguments.name = "我是从上个页面传的";
                arguments.age = 18;
                Navigator.pushNamed(context, "second", arguments: arguments);

                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondPage(),
                            settings: RouteSettings(
                                name: 'second', arguments: arguments)))
                    .then((value) {
                  result = value as Arguments;
                  print(result.toString());
                  setState(() {});
                });
              },
              child: Text(
                result.name,
                style: TextStyle(color: Colors.redAccent),
              )),
        ),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    result.name = "我是首页";
    super.initState();
  }

  @override
  void didPushNext() {
    print('HomePage didPushNext');
  }

  @override
  void didPop() {
    print('HomePage didPop');
  }

  @override
  void didPush() {
    print('HomePage didPush');
  }

  @override
  void didPopNext() {
    print('HomePage didPopNext');
  }

  @override
  void dispose() {
    super.dispose();
    routeObserver.unsubscribe(this);
  }
}
