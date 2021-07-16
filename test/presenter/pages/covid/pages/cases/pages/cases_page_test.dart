import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_super_app/core/modules/app_module.dart';
import 'package:flutter_super_app/core/modules/covid/case_module.dart';
import 'package:flutter_super_app/infra/datasources/covid/external_covid_datasource.dart';
import 'package:flutter_super_app/infra/models/covid/case_model.dart';
import 'package:flutter_super_app/presenter/pages/covid/pages/cases/cases_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../utils/modular_mock.dart';
import 'cases_page_test.mocks.dart';

abstract class ExternalCovidDatasource extends Mock
    implements ExternalCovidDatasourceInterface {}

@GenerateMocks([ExternalCovidDatasource])
void main() {
  late MockExternalCovidDatasource externalCovidDatasourceMock;

  group('CasesPage', () {
    setUp(() {
      initModules(
        [
          AppModule(),
          CaseModule(),
        ],
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

    testWidgets('Should redirect for next screen (ValueNotifier or BLoC screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        modularMock(),
      );

      await tester.pumpWidget(
        buildTestableWidget(
          CasesPage(),
        ),
      );

      final valueNotifierFind = find.byKey(Key('ValueNotifier'));
      final blocFind = find.byKey(Key('BLoC'));

      expect(valueNotifierFind, findsOneWidget);
      expect(blocFind, findsOneWidget);

      await tester.tap(blocFind);
      await tester.pump();
    });
  });
}
