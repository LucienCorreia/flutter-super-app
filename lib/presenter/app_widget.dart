import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../routes.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: Routes.routes,
    ).modular();
  }
}
