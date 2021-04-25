import '../../../../domain/entities/covid/case_entity.dart';
import '../../../../infra/datasources/covid/external_covid_datasource.dart';
import '../../../../infra/models/covid/case_model.dart';

class ExternalCovidDatasourceMock implements ExternalCovidDatasourceInterface {
  final List<CaseEntity> _cases = CaseModel.fakeList(300);

  @override
  Future<List<CaseEntity>> getCases({
    String search = '',
  }) async {
    Future.delayed(
      Duration(
        milliseconds: 300,
      ),
    );

    if (search.isNotEmpty) {
      return _cases
          .where((element) => element.country.startsWith(search))
          .toList();
    }

    return _cases;
  }
}
