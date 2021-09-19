import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  final Widget child;
  final Map<String, WidgetBuilder> additionalRoutes;
  final List<NavigatorObserver> navigatorObservers;
  final Size screenSize;

  const TestApp(
    this.child, {
    Key? key,
    this.additionalRoutes = const {},
    this.navigatorObservers = const <NavigatorObserver>[],
    this.screenSize = const Size(568, 800),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: key,
      title: 'Test wrapper',
      theme: ThemeData(),
      home: Scaffold(body: body),
      routes: additionalRoutes,
      navigatorObservers: navigatorObservers,
    );
  }

  Widget get body => Container(
        height: screenSize.height,
        width: screenSize.width,
        child: child,
      );
}
