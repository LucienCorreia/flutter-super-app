import 'package:flutter_modular/flutter_modular.dart';

import '../../../../presenter/pages/covid/pages/cases/triple/cases_page.dart';
import '../../../../presenter/pages/covid/pages/cases/triple/cases_state.dart';
import '../../../../presenter/pages/covid/pages/cases/triple/triples/cases_triple.dart';
import '../../../../presenter/pages/covid/pages/cases/triple/triples/search_triple.dart';
import '../../../../presenter/pages/covid/pages/cases/triple/triples/show_search_bar_triple.dart';

class CasesTripleModule extends Module {
  @override
  final List<Bind> binds = [
    // states
    Bind(
      (i) => CasesState(
        casesTriple: i.get(),
        searchTriple: i.get(),
        showSearchBarTriple: i.get(),
      ),
    ),
    // triples
    Bind(
      (i) => CasesTriple(
        getCasesUsecase: i.get(),
        searchCasesUsecase: i.get(),
      ),
    ),
    Bind(
      (i) => SearchTriple(),
    ),
    Bind(
      (i) => ShowSearchBarTriple(),
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
