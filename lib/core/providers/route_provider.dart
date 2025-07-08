import 'dart:html' as html;

import 'package:flutter/widgets.dart';

class RouteProvider extends ChangeNotifier {
  String? _savedRoute;

  void saveRouteToLocalStorage(String route) {
    html.window.localStorage['savedRoute'] = route;
    _savedRoute = route;
    notifyListeners();
  }

  String? getRouteFromLocalStorage() {
    _savedRoute = html.window.localStorage['savedRoute'];
    return _savedRoute;
  }

  void clearRouteFromLocalStorage() {
    html.window.localStorage.remove('savedRoute');
    _savedRoute = null;
    notifyListeners();
  }
}
