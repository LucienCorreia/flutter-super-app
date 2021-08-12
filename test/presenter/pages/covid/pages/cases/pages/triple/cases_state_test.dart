import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_super_app/core/modules/covid/case_module.dart';
import 'package:flutter_super_app/core/modules/covid/cases/cases_triple_module.dart';
import 'package:flutter_super_app/infra/datasources/covid/external_covid_datasource.dart';
import 'package:flutter_super_app/infra/models/covid/case_model.dart';
import 'package:flutter_super_app/presenter/pages/covid/pages/cases/triple/cases_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'cases_page_test.mocks.dart';

void main() {
  late MockExternalCovidDatasource externalCovidDatasourceMock;

  group('CasesState', () {
    setUpAll(() async {
      initModules(
        [
          CaseModule(),
          CasesTripleModule(),
        ],
        replaceBinds: [
          Bind<ExternalCovidDatasourceInterface>(
            (i) => MockExternalCovidDatasource(),
          ),
        ],
      );

      externalCovidDatasourceMock = Modular.get();
    });

    test(
        'Should search in cases by "123456789" and state of casesState should empty',
        () {
      final CasesState casesState = Modular.get();

      when(externalCovidDatasourceMock.getCases())
          .thenAnswer((_) async => CaseModel.fakeList(300));

      casesState.searchTriple.update('123456789');

      expect(casesState.searchTriple.state, equals('123456789'));
      expect(casesState.casesTriple.state.length, equals(0));
    });
  });
}
