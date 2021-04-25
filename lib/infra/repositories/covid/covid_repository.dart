import 'package:flutter_example/infra/datasources/covid/external_covid_datasource.dart';

import '../../../domain/entities/covid/case_entity.dart';
import '../../../domain/repositories/covid/covid_repository.dart';

class CovidRepository extends CovidRepositoryInterface {
  final ExternalCovidDatasourceInterface _externalCovidDatasource;

  CovidRepository({
    required ExternalCovidDatasourceInterface externalCovidDatasource,
  }) : _externalCovidDatasource = externalCovidDatasource;

  @override
  Future<List<CaseEntity>> getCases({
    String search = '',
  }) async {
    return await _externalCovidDatasource.getCases(
      search: search,
    );
  }
}
