import 'package:flutter/material.dart';

import 'presenter/pages/home/home_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (_) => HomePage(),
  };
}
