import '../../entities/covid/case_entity.dart';
import '../../repositories/covid/covid_repository.dart';

class GetCasesUsecase {
  final CovidRepositoryInterface _covidRepository;

  GetCasesUsecase({
    required CovidRepositoryInterface covidRepository,
  }) : _covidRepository = covidRepository;

  Future<List<CaseEntity>> call({
    String search = '',
  }) async {
    return await _covidRepository.getCases(
      search: search,
    );
  }
}
