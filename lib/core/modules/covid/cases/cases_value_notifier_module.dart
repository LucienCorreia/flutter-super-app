import 'package:flutter_modular/flutter_modular.dart';

import '../../../../presenter/pages/covid/pages/cases/value_notifier/cases_page.dart';
import '../../../../presenter/pages/covid/pages/cases/value_notifier/cases_state.dart';

class CasesValueNotifierModule extends Module {
  @override
  final List<Bind> binds = [
    // states
    Bind(
      (i) => CasesState(
        getCasesUsecase: i.get(),
        searchCasesUsecase: i.get(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => CasesPage(),
    ),
  ];
}
