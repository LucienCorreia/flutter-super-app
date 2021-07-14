import 'package:flutter_modular/flutter_modular.dart';

import 'blocs/cases/cases_bloc.dart';
import 'blocs/search/search_bloc.dart';
import 'blocs/show_search_bar/show_search_bloc_bar.dart';

class CasesState extends Disposable {
  final CasesBloc _casesBloc;
  final SearchBloc _searchBloc;
  final ShowSearchBarBloc _showSearchBarBloc;

  CasesState({
    required CasesBloc casesBloc,
    required SearchBloc searchBloc,
    required ShowSearchBarBloc showSearchBarBloc,
  })  : _casesBloc = casesBloc,
        _searchBloc = searchBloc,
        _showSearchBarBloc = showSearchBarBloc {
    _casesBloc.add('');
    _showSearchBarBloc.add(false);
  }

  CasesBloc get casesBloc => _casesBloc;

  SearchBloc get searchBloc => _searchBloc;

  ShowSearchBarBloc get showSearchBarBloc => _showSearchBarBloc;

  @override
  void dispose() {
    _casesBloc.close();
    _searchBloc.close();
    _showSearchBarBloc.close();
  }
}
