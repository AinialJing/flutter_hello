import 'package:flutter/material.dart';
import 'package:flutter_hello/home_page.dart';

class MyNavigator1PageStaticRoutes extends StatefulWidget {
  const MyNavigator1PageStaticRoutes({super.key});

  @override
  State<MyNavigator1PageStaticRoutes> createState() =>
      _MyNavigator1PageStaticRoutesState();
}

class _MyNavigator1PageStaticRoutesState
    extends State<MyNavigator1PageStaticRoutes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigator1.0',
      // routes: <String, WidgetBuilder>{
      //   "home": (context) {
      //     return HomePage();
      //   },
      //   "second": (context) {
      //     return SecondPage();
      //   },
      //   "three":(context){
      //     return MyThreePage();
      //   }
      // },
      // initialRoute: "home",
      home: HomePage(),
    );
  }
}
