import '../../../domain/entities/covid/case_entity.dart';

abstract class ExternalCovidDatasourceInterface {
  Future<List<CaseEntity>> getCases({
    String search = '',
  });
}
