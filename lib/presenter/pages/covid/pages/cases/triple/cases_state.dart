import 'triples/cases_triple.dart';
import 'triples/search_triple.dart';
import 'triples/show_search_bar_triple.dart';

class CasesState {
  final CasesTriple _casesTriple;
  final SearchTriple _searchTriple;
  final ShowSearchBarTriple _showSearchBarTriple;

  CasesState({
    required CasesTriple casesTriple,
    required SearchTriple searchTriple,
    required ShowSearchBarTriple showSearchBarTriple,
  })  : _casesTriple = casesTriple,
        _searchTriple = searchTriple,
        _showSearchBarTriple = showSearchBarTriple {
    _casesTriple.search('');

    _searchTriple.observer(
      onState: (search) => _casesTriple.search(search),
    );
  }

  CasesTriple get casesTriple => _casesTriple;

  SearchTriple get searchTriple => _searchTriple;

  ShowSearchBarTriple get showSearchBarTriple => _showSearchBarTriple;
}
