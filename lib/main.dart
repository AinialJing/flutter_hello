import 'package:flutter/material.dart';
import 'package:flutter_hello/arguments.dart';
import 'package:flutter_hello/channel/basic_message_channel.dart';
import 'package:flutter_hello/navigator2/custome_routes.dart';

import 'androidview/cell.dart';

void main() {
  runApp(MyBasicMessageChannel());
}

@pragma("vm:entry-point")
void showCell() {
  runApp(const Cell());
}

Arguments arguments = Arguments();
MyRoutes myRoutes = MyRoutes();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();
