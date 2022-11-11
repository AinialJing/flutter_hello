import 'package:flutter/material.dart';
import 'package:flutter_hello/arguments.dart';
import 'package:flutter_hello/navigator2/custome_routes.dart';

import 'androidview/cell.dart';
import 'container_widget/bottomsheet_operator.dart';
import 'container_widget/scaffold_widget.dart';

void main() {
  runApp(ScaffoldWidget());
}

@pragma("vm:entry-point")
void showCell() {
  runApp(const Cell());
}

Arguments arguments = Arguments();
MyRoutes myRoutes = MyRoutes();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
