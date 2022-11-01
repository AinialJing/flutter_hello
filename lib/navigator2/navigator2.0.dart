import 'package:flutter/material.dart';
import 'package:flutter_hello/main.dart';

class Navigator2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: myRoutes,
    );
  }
}
