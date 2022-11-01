import 'package:flutter/material.dart';
import 'package:flutter_hello/arguments.dart';
import 'package:flutter_hello/exchangeData/widget_event_bus.dart';
import 'package:flutter_hello/navigator2/custome_routes.dart';

void main() {
  runApp(ShareDataWithEventBus());
}

Arguments arguments = Arguments();
MyRoutes myRoutes = MyRoutes();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
