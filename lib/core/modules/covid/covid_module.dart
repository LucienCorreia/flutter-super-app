import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'case_module.dart';

class CovidModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
        ChildRoute(
          '/',
          child: (_, __) => Container(),
        ),
        ModuleRoute(
          '/cases',
          module: CaseModule(),
        ),
      ];
}
