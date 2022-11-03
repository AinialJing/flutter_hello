import 'package:flutter/material.dart';
import 'package:flutter_hello/arguments.dart';
import 'package:flutter_hello/navigator2/custome_routes.dart';

import 'arguments/single_instance.dart';

void main() {
  runApp(GloableSingleInstance());
}

Arguments arguments = Arguments();
MyRoutes myRoutes = MyRoutes();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
