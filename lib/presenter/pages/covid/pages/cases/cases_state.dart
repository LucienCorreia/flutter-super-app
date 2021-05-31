import 'package:flutter/foundation.dart';

import '../../../../../domain/entities/covid/case_entity.dart';
import '../../../../../domain/usecases/covid/get_cases_usecase.dart';
import '../../../../widgets/load_notifier/load_notifier_listenable.dart';

class CasesState extends ChangeNotifier {
  final _casesListenable = LoadNotifierListenable<List<CaseEntity>?>(null);
  final GetCasesUsecase _getCasesUsecase;

  LoadNotifierListenable<List<CaseEntity>?> get casesListenable =>
      _casesListenable;

  CasesState({
    required GetCasesUsecase getCasesUsecase,
  }) : _getCasesUsecase = getCasesUsecase {
    _init();
  }

  Future<void> _init() async {
    try {
      _casesListenable.value = await _getCasesUsecase();
    } catch (error) {
      _casesListenable.setError(error);
    }
  }
}
