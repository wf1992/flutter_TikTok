import 'package:flutter/cupertino.dart';

NavigationService navigationService = NavigationService();

class NavigationService {
  factory NavigationService() => _getInstance();

  static NavigationService _getInstance() => _instance;
  static NavigationService _instance = NavigationService._internal();
  late GlobalKey<NavigatorState> navigatorKey;

  NavigationService._internal() {
    navigatorKey = GlobalKey<NavigatorState>();
  }


  Future<T?> navigateTo<T>(Route<T> route) {
    return navigatorKey.currentState!.push<T>(route);
  }

  void goBack() {
    return navigatorKey.currentState?.pop();
  }

  Future cNavigateTo(Widget controller) {
    return navigationService.navigateTo(CupertinoPageRoute(
      builder: (context) => controller,
    ));
  }
  // Navigator.of(context).push(new CupertinoPageRoute(builder: (ctx) => new SHController()));
}
