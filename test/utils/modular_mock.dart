import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_super_app/core/modules/app_module.dart';
import 'package:flutter_super_app/presenter/app_widget.dart';

modularMock() {
  return ModularApp(
    module: AppModule(),
    child: AppWidget(),
  );
}
