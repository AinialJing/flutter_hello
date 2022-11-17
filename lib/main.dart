import 'package:flutter/material.dart';
import 'package:flutter_hello/arguments.dart';
import 'package:flutter_hello/container_widget/flow_page.dart';
import 'package:flutter_hello/navigator2/custome_routes.dart';

import 'androidview/cell.dart';

void main() {
  runApp(FlowApp());
}

@pragma("vm:entry-point")
void showCell() {
  runApp(const Cell());
}

Arguments arguments = Arguments();
MyRoutes myRoutes = MyRoutes();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
