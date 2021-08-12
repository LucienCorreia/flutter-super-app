import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_super_app/core/modules/covid/case_module.dart';
import 'package:flutter_super_app/infra/datasources/covid/external_covid_datasource.dart';
import 'package:flutter_super_app/infra/models/covid/case_model.dart';
import 'package:flutter_super_app/presenter/pages/covid/pages/cases/triple/triples/cases_triple.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:triple_test/triple_test.dart';

import 'cases_triple_test.mocks.dart';

class ExternalCovidDatasource extends Mock
    implements ExternalCovidDatasourceInterface {}

@GenerateMocks([ExternalCovidDatasource])
void main() {
  late MockExternalCovidDatasource externalCovidDatasourceMock;

  group('CasesTriple', () {
    setUpAll(() {
      initModules(
        [
          CaseModule(),
          // CasesTripleModule(),
        ],
        replaceBinds: [
          Bind<ExternalCovidDatasourceInterface>(
            (i) => MockExternalCovidDatasource(),
          ),
        ],
      );

      externalCovidDatasourceMock = Modular.get();
    });

    storeTest<CasesTriple>(
      'Should state is an list of [CaseEntity] when successful',
      build: () {
        when(externalCovidDatasourceMock.getCases())
            .thenAnswer((_) => Future.value(CaseModel.fakeList(300)));

        return CasesTriple(
          getCasesUsecase: Modular.get(),
          searchCasesUsecase: Modular.get(),
        );
      },
      act: (triple) async => await triple.search(),
      expect: () => [
        tripleState,
        tripleLoading,
        tripleState,
      ],
    );

    storeTest<CasesTriple>(
      'Should state is a empty list of [CaseEntity] when successful search by "123456789"',
      build: () {
        when(externalCovidDatasourceMock.getCases())
            .thenAnswer((_) => Future.value(CaseModel.fakeList(300)));

        return CasesTriple(
          getCasesUsecase: Modular.get(),
          searchCasesUsecase: Modular.get(),
        );
      },
      act: (triple) async => await triple.search('123456789'),
      expect: () => [
        tripleState,
        tripleLoading,
        tripleState,
      ],
    );

    storeTest<CasesTriple>(
      'Should throw exception',
      build: () {
        when(externalCovidDatasourceMock.getCases())
            .thenThrow((_) => throw Exception());

        return CasesTriple(
          getCasesUsecase: Modular.get(),
          searchCasesUsecase: Modular.get(),
        );
      },
      act: (triple) async => await triple.search(),
      expect: () => [
        tripleState,
        tripleLoading,
        tripleError,
      ],
    );
  });
}
