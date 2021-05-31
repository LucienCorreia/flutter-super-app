import '../../entities/covid/case_entity.dart';

abstract class CovidRepositoryInterface {
  Future<List<CaseEntity>> getCases();
}
