import 'package:flutter_modular/flutter_modular.dart';

import '../../../../presenter/pages/covid/pages/cases/bloc/blocs/cases/cases_bloc.dart';
import '../../../../presenter/pages/covid/pages/cases/bloc/blocs/search/search_bloc.dart';
import '../../../../presenter/pages/covid/pages/cases/bloc/blocs/show_search_bar/show_search_bloc_bar.dart';
import '../../../../presenter/pages/covid/pages/cases/bloc/cases_page.dart';
import '../../../../presenter/pages/covid/pages/cases/bloc/cases_state.dart';

class CasesBlocModule extends Module {
  @override
  final List<Bind> binds = [
    // states
    Bind(
      (i) => CasesState(
        casesBloc: CasesBloc(
          getCasesUsecase: i.get(),
          searchCasesUsecase: i.get(),
        ),
        searchBloc: SearchBloc(),
        showSearchBarBloc: ShowSearchBarBloc(),
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
