import 'package:flutter/material.dart';

import '../../../../../../domain/entities/covid/case_entity.dart';
import '../../../../../../domain/usecases/covid/search_cases_usecase.dart';
import '../../../../../../domain/usecases/covid/get_cases_usecase.dart';
import '../../../../../widgets/load_notifier/load_notifier_listenable.dart';

class CasesState extends ChangeNotifier {
  final _casesListenable = LoadNotifierListenable<List<CaseEntity>?>(null);
  final _searchBarVisibleListenable = ValueNotifier<bool>(false);
  final _textSearchListenable = ValueNotifier<String>('');

  final GetCasesUsecase _getCasesUsecase;
  final SearchCasesUsecase _searchCasesUsecase;

  LoadNotifierListenable<List<CaseEntity>?> get casesListenable =>
      _casesListenable;

  ValueNotifier<bool> get searchBarVisibleListenable =>
      _searchBarVisibleListenable;

  ValueNotifier<String> get textSearchListenable => _textSearchListenable;

  CasesState({
    required GetCasesUsecase getCasesUsecase,
    required SearchCasesUsecase searchCasesUsecase,
  })  : _getCasesUsecase = getCasesUsecase,
        _searchCasesUsecase = searchCasesUsecase {
    _init();
  }

  Future<void> _init() async {
    try {
      _casesListenable.value = await _getCasesUsecase();

      _textSearchListenable.addListener(_search);
    } catch (error) {
      _casesListenable.setError(error);
    }
  }

  void _search() async {
    _casesListenable.setLoading();

    final textSearch = _textSearchListenable.value;
    final cases = _casesListenable.value = await _getCasesUsecase();

    _casesListenable.value = _searchCasesUsecase(
      cases: cases,
      search: textSearch,
    );
  }
}
