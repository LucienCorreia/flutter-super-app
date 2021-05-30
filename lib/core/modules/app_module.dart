import 'package:flutter_modular/flutter_modular.dart';

import '../http/http.dart';
import 'covid/covid_module.dart';
import 'home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => Http(),
      isLazy: false,
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/covid', module: CovidModule()),
  ];
}
