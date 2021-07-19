import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_super_app/core/modules/covid/case_module.dart';
import 'package:flutter_super_app/core/modules/covid/cases/cases_mobx_module.dart';
import 'package:flutter_super_app/domain/entities/covid/case_entity.dart';
import 'package:flutter_super_app/infra/datasources/covid/external_covid_datasource.dart';
import 'package:flutter_super_app/infra/models/covid/case_model.dart';
import 'package:flutter_super_app/presenter/pages/covid/pages/cases/mobx/cases_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cases_state_test.mocks.dart';

class ExternalCovidDatasource extends Mock
    implements ExternalCovidDatasourceInterface {}

@GenerateMocks([ExternalCovidDatasource])
void main() {
  late MockExternalCovidDatasource externalCovidDatasourceMock;

  setUp(() {
    initModules(
      [
        CasesMobxModule(),
        CaseModule(),
      ],
      replaceBinds: [
        Bind<ExternalCovidDatasourceInterface>(
          (i) => MockExternalCovidDatasource(),
        ),
      ],
    );

    externalCovidDatasourceMock = Modular.get();
  });

  group('CasesState', () {
    test(
        'Should successful states ([cases] notEmpty, [loading] false, [error] null)',
        () async {
      when(externalCovidDatasourceMock.getCases())
          .thenAnswer((_) => Future.value(CaseModel.fakeList(300)));

      final caseState = CasesState(
        getCasesUsecase: Modular.get(),
        searchCasesUsecase: Modular.get(),
      );

      expect(caseState.cases, isA<List<CaseEntity>>());
      expect(caseState.cases.length, equals(0));
      expect(caseState.error, equals(null));
      expect(caseState.loading, true);

      await Future.delayed(Duration.zero);

      expect(caseState.cases, isA<List<CaseEntity>>());
      expect(caseState.cases.length, equals(300));
      expect(caseState.error, equals(null));
      expect(caseState.loading, false);
    });

    test(
        'Should error states ([cases] empty, [loading] false, [error] Exception)',
        () async {
      when(externalCovidDatasourceMock.getCases())
          .thenAnswer((_) async => throw Exception('API error!'));

      final caseState = CasesState(
        getCasesUsecase: Modular.get(),
        searchCasesUsecase: Modular.get(),
      );

      expect(caseState.cases, isA<List<CaseEntity>>());
      expect(caseState.cases.length, equals(0));
      expect(caseState.error, equals(null));
      expect(caseState.loading, true);

      await Future.delayed(Duration.zero);

      expect(caseState.cases, isA<List<CaseEntity>>());
      expect(caseState.cases.length, equals(0));
      expect(caseState.error, isA<Exception>());
      expect(caseState.loading, false);
    });

    test('Should cases is empty before search by "123456789"', () {
      when(externalCovidDatasourceMock.getCases())
          .thenAnswer((_) => Future.value(CaseModel.fakeList(300)));

      final caseState = CasesState(
        getCasesUsecase: Modular.get(),
        searchCasesUsecase: Modular.get(),
      );

      caseState.setTextSearch = '123456789';

      expect(caseState.cases, isA<List<CaseEntity>>());
      expect(caseState.cases.length, equals(0));
      expect(caseState.error, equals(null));
      expect(caseState.loading, true);
    });
  });
}
