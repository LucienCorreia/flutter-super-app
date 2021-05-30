import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../domain/entities/covid/case_entity.dart';
import '../../../../widgets/load_notifier/load_notifier_builder_widget.dart';
import 'cases_state.dart';
import 'widgets/case_card_widget.dart';

class CasesPage extends StatefulWidget {
  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends ModularState<CasesPage, CasesState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Covid-19 - Cases'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: LoadNotifierBuilderWidget<List<CaseEntity>?>(
        valueListenable: controller.casesListenable,
        onLoading: Center(
          child: CircularProgressIndicator(),
        ),
        onError: (context, error) => Center(
          child: Text('Ocorreu um erro ao carregar!'),
        ),
        onDone: (context, cases) => ListView.builder(
          itemCount: cases!.length,
          itemBuilder: (context, index) => CaseCardWidget(cases[index]),
        ),
      ),
    );
  }
}
