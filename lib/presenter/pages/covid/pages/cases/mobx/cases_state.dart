import 'package:flutter_super_app/domain/usecases/covid/get_cases_usecase.dart';
import 'package:flutter_super_app/domain/usecases/covid/search_cases_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../domain/entities/covid/case_entity.dart';

part 'cases_state.g.dart';

class CasesState = CasesStateBase with _$CasesState;

abstract class CasesStateBase with Store {
  final GetCasesUsecase _getCasesUsecase;
  final SearchCasesUsecase _searchCasesUsecase;

  @observable
  ObservableList<CaseEntity> cases = <CaseEntity>[].asObservable();

  @observable
  ObservableList<CaseEntity> searchedCases = <CaseEntity>[].asObservable();

  @observable
  String textSearch = '';

  @observable
  bool showSearchBar = false;

  @observable
  Exception? error;

  @observable
  bool loading = true;

  CasesStateBase({
    required GetCasesUsecase getCasesUsecase,
    required SearchCasesUsecase searchCasesUsecase,
  })  : _getCasesUsecase = getCasesUsecase,
        _searchCasesUsecase = searchCasesUsecase {
    _init();
  }

  set setTextSearch(String newValue) {
    textSearch = newValue;

    search();
  }

  Future<void> _init() async {
    try {
      cases.addAll(await _getCasesUsecase());
      searchedCases.addAll(cases);
    } catch (e) {
      error = Exception('API error!');
    } finally {
      loading = false;
    }
  }

  void search() {
    searchedCases.clear();
    searchedCases.addAll(_searchCasesUsecase(cases: cases, search: textSearch));
  }
}
