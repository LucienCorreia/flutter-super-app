import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_super_app/core/modules/covid/case_module.dart';
import 'package:flutter_super_app/core/modules/covid/cases/cases_triple_module.dart';
import 'package:flutter_super_app/infra/datasources/covid/external_covid_datasource.dart';
import 'package:flutter_super_app/infra/models/covid/case_model.dart';
import 'package:flutter_super_app/presenter/pages/covid/pages/cases/triple/cases_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'cases_page_test.mocks.dart';

class ExternalCovidDatasource extends Mock
    implements ExternalCovidDatasourceInterface {}

@GenerateMocks([ExternalCovidDatasource])
void main() {
  late MockExternalCovidDatasource externalCovidDatasourceMock;

  group('CasesPage', () {
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

    testWidgets(
        'Should load a listing covid cases, 300 items and toggle search bar',
        (WidgetTester tester) async {
      when(externalCovidDatasourceMock.getCases())
          .thenAnswer((_) => Future.value(CaseModel.fakeList(300)));

      await tester.pumpWidget(
        buildTestableWidget(
          CasesPage(),
        ),
      );
      await tester.pumpAndSettle();

      final findListView = find.byType(
        ListView,
      );

      expect(findListView, findsOneWidget);
      expect(tester.widget<ListView>(findListView).semanticChildCount,
          equals(300));

      final iconButtonFinder = find.byType(IconButton);

      await tester.tap(iconButtonFinder);
      await tester.pumpAndSettle();

      expect((iconButtonFinder as IconButton).icon, equals(Icons.search));
    });

    testWidgets('Should show API error message', (WidgetTester tester) async {
      when(externalCovidDatasourceMock.getCases()).thenThrow(Exception());

      await tester.pumpWidget(
        buildTestableWidget(
          CasesPage(),
        ),
      );
      await tester.pumpAndSettle();

      final findListView = find.byType(
        ListView,
      );
      final findMessageError = find.byKey(Key('message-error'));

      expect(findListView, findsNothing);
      expect(findMessageError, findsOneWidget);
    });
  });
}
