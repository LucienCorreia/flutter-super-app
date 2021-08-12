import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../../domain/entities/covid/case_entity.dart';
import '../../../../../../../domain/usecases/covid/get_cases_usecase.dart';
import '../../../../../../../domain/usecases/covid/search_cases_usecase.dart';

class CasesTriple extends StreamStore<Exception, List<CaseEntity>> {
  final GetCasesUsecase _getCasesUsecase;
  final SearchCasesUsecase _searchCasesUsecase;

  final List<CaseEntity> _cases = [];

  CasesTriple({
    required GetCasesUsecase getCasesUsecase,
    required SearchCasesUsecase searchCasesUsecase,
    List<CaseEntity> initialState = const <CaseEntity>[],
  })  : _getCasesUsecase = getCasesUsecase,
        _searchCasesUsecase = searchCasesUsecase,
        super(initialState);

  Future<void> search([
    String textSearch = '',
  ]) async {
    setLoading(true);

    try {
      if (textSearch.isEmpty && _cases.isNotEmpty) {
        update(_cases);
      } else if (textSearch.isEmpty) {
        _cases.clear();
        _cases.addAll(await _getCasesUsecase());
        update(_cases);
      } else {
        update(_searchCasesUsecase(
          cases: _cases,
          search: textSearch,
        ));
      }
    } catch (e) {
      setError(Exception('API error!'));
    } finally {
      setLoading(false);
    }
  }
}
