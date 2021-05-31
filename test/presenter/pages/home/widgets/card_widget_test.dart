import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_super_app/presenter/pages/home/widgets/card_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CardWidget', (WidgetTester tester) async {
    final icon = Icons.people;
    final title = 'Page';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CardWidget(
            title: title,
            icon: icon,
          ),
        ),
      ),
    );

    final iconFinder = tester.widget<Icon>(
      find.byKey(
        Key('card-icon'),
      ),
    );
    final titleFinder = tester.widget<Text>(
      find.byKey(
        Key('card-title'),
      ),
    );

    expect(iconFinder.icon, equals(icon));
    expect(titleFinder.data, equals(title));
  });
}
