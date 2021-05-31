import 'package:flutter_super_app/core/modules/covid/case_module.dart';
import 'package:flutter_super_app/domain/entities/covid/case_entity.dart';
import 'package:flutter_super_app/domain/usecases/covid/get_cases_usecase.dart';
import 'package:flutter_super_app/external/datasources/mocks/covid/external_covid_datasource_mock.dart';
import 'package:flutter_super_app/infra/datasources/covid/external_covid_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetCasesUsecase', () {
    setUp(() {
      initModule(
        CaseModule(),
        replaceBinds: [
          Bind<ExternalCovidDatasourceInterface>(
            (i) => ExternalCovidDatasourceMock(),
          ),
        ],
      );
    });

    test('Init', () async {
      final getCasesUsecase = Modular.get<GetCasesUsecase>();

      final cases = await getCasesUsecase();

      expect(
        cases,
        isA<List<CaseEntity>>(),
      );
    });
  });
}
