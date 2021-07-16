import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../domain/entities/covid/case_entity.dart';
import '../../../../../../../../domain/usecases/covid/get_cases_usecase.dart';
import '../../../../../../../../domain/usecases/covid/search_cases_usecase.dart';
import 'cases_bloc_states.dart';

class CasesBloc extends Bloc<String, CasesBlocState> {
  final GetCasesUsecase _getCasesUsecase;
  final SearchCasesUsecase _searchCasesUsecase;

  List<CaseEntity> _cases = [];

  CasesBloc({
    required GetCasesUsecase getCasesUsecase,
    required SearchCasesUsecase searchCasesUsecase,
  })  : _getCasesUsecase = getCasesUsecase,
        _searchCasesUsecase = searchCasesUsecase,
        super(CasesBlocStateLoading());

  @override
  Stream<CasesBlocState> mapEventToState(String search) async* {
    yield const CasesBlocStateLoading();

    try {
      if (search.isEmpty && _cases.isNotEmpty) {
        yield CasesBlocStateLoaded(_cases);
      } else if (search.isEmpty) {
        _cases = await _getCasesUsecase();
        yield CasesBlocStateLoaded(_cases);
      } else {
        yield CasesBlocStateLoaded(
          _searchCasesUsecase(
            cases: _cases,
            search: search,
          ),
        );
      }
    } catch (e) {
      yield CasesBlocStateFailure(Exception('API error!'));
    }
  }
}
