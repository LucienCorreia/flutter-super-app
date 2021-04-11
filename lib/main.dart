import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/modules/app_module.dart';
import 'presenter/app_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
