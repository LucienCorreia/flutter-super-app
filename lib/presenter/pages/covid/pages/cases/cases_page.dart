import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CasesPage extends StatelessWidget {
  const CasesPage({
    Key? key,
  }) : super(
          key: key,
        );

  static const Map<String, String> items = {
    'ValueNotifier': '/covid/cases/value-notifier',
    'BLoC': '/covid/cases/bloc',
    'MobX': '/covid/cases/mobx',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 - Cases'),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) => ListTile(
          key: Key('${items.keys.elementAt(index)}'),
          title: Text(
            '${items.keys.elementAt(index)}',
          ),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => Modular.to.pushNamed('${items.values.elementAt(index)}'),
        ),
        itemCount: items.length,
      ),
    );
  }
}
