import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hello/navigator2/navigator2_home_page.dart';

class MyRoutes extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  final List<Page> _pages = [];
  late Completer<Object?> _boolResult;

  MyRoutes() {
    _pages.add(MaterialPage(child: Navigator2HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: navigatorKey, pages: List.of(_pages), onPopPage: _onPopPage);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  @override
  Future<bool> popRoute({Object? params}) {
    if ((params != null)) {
      _boolResult.complete(params);
    }
    if (_canPop()) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return Future.value(true);
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    if (_canPop()) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }

  bool _canPop() {
    return _pages.length > 1;
  }

  Future<Object?> push({required Widget widget, dynamic arguments}) {
    _boolResult = Completer<Object?>();
    _pages.add(MaterialPage(child: widget,arguments: arguments));
    notifyListeners();
    return _boolResult.future;
  }

  void replace({required Widget widget, dynamic arguments}) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
      notifyListeners();
    }
    push(widget: widget, arguments: arguments);
  }
}
