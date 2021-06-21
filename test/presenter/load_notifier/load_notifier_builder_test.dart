import 'package:flutter/material.dart';
import 'package:flutter_super_app/presenter/widgets/load_notifier/load_notifier_builder_widget.dart';
import 'package:flutter_super_app/presenter/widgets/load_notifier/load_notifier_listenable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoadNotifierBuilder', () {
    testWidgets('Build', (WidgetTester tester) async {
      final loadNotifierListenable = LoadNotifierListenable<int>(0);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LoadNotifierBuilderWidget<int>(
              valueListenable: loadNotifierListenable,
              onError: (context, error) => Text(
                'error',
                key: Key('error'),
              ),
              onLoading: (context) => Text(
                'loading',
                key: Key('loading'),
              ),
              onDone: (context, value) => Text(
                '$value',
                key: Key('value'),
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(Key('loading')), findsOneWidget);
      expect(find.byKey(Key('error')), findsNothing);
      expect(find.byKey(Key('value')), findsNothing);

      loadNotifierListenable.value = 1;

      await tester.pumpAndSettle();

      expect(find.byKey(Key('loading')), findsNothing);
      expect(find.byKey(Key('error')), findsNothing);
      expect(find.byKey(Key('value')), findsOneWidget);

      loadNotifierListenable.setError(Exception('error'));

      await tester.pumpAndSettle();

      expect(find.byKey(Key('loading')), findsNothing);
      expect(find.byKey(Key('error')), findsOneWidget);
      expect(find.byKey(Key('value')), findsNothing);
    });
  });
}
