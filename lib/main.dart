import 'package:flutter/material.dart';
import 'package:flutter_hello/arguments.dart';
import 'package:flutter_hello/arguments/sharedpreference.dart';
import 'package:flutter_hello/navigator2/custome_routes.dart';

void main() {
  runApp(MySharedPreference());
}

Arguments arguments = Arguments();
MyRoutes myRoutes = MyRoutes();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
