import 'package:flutter_super_app/core/modules/covid/case_module.dart';
import 'package:flutter_super_app/domain/entities/covid/case_entity.dart';
import 'package:flutter_super_app/domain/usecases/covid/get_cases_usecase.dart';
import 'package:flutter_super_app/infra/datasources/covid/external_covid_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_super_app/infra/models/covid/case_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cases_usecase_test.mocks.dart';

abstract class ExternalCovidDatasource extends Mock
    implements ExternalCovidDatasourceInterface {}

@GenerateMocks([ExternalCovidDatasource])
void main() {
  late MockExternalCovidDatasource externalCovidDatasourceMock;

  setUpAll(() {
    initModule(
      CaseModule(),
      replaceBinds: [
        Bind<ExternalCovidDatasourceInterface>(
          (i) => MockExternalCovidDatasource(),
        ),
      ],
    );
    externalCovidDatasourceMock = Modular.get();

    when(externalCovidDatasourceMock.getCases())
        .thenAnswer((_) => Future.value(CaseModel.fakeList(300)));
  });

  group('GetCasesUsecase', () {
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
