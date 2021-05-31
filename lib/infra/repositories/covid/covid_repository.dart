import '../../../domain/entities/covid/case_entity.dart';
import '../../../domain/repositories/covid/covid_repository.dart';
import '../../datasources/covid/external_covid_datasource.dart';

class CovidRepository extends CovidRepositoryInterface {
  final ExternalCovidDatasourceInterface _externalCovidDatasource;

  CovidRepository({
    required ExternalCovidDatasourceInterface externalCovidDatasource,
  }) : _externalCovidDatasource = externalCovidDatasource;

  @override
  Future<List<CaseEntity>> getCases() async {
    return await _externalCovidDatasource.getCases();
  }
}
