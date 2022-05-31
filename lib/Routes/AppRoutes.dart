// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toyshop/Constant/RouteConstants.dart';
import 'package:toyshop/UI/Category.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final animationDuration =
    Duration(milliseconds: 300);
    final routeArgs = settings.arguments;
    switch (settings.name) {
      case RouteConstants.initialRoute:
        return PageTransition(
            child: CategoryUi(),
            type: PageTransitionType.rightToLeft,
            duration: animationDuration);

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}