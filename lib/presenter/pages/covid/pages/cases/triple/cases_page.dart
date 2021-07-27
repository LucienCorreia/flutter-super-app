import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../domain/entities/covid/case_entity.dart';
import '../widgets/case_card_widget.dart';
import '../widgets/search_bar_widget.dart';
import 'cases_state.dart';
import 'triples/cases_triple.dart';
import 'triples/show_search_bar_triple.dart';

class CasesPage extends StatefulWidget {
  const CasesPage({Key? key}) : super(key: key);

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
        actions: [
          TripleBuilder<ShowSearchBarTriple, Exception, bool>(
            store: controller.showSearchBarTriple,
            builder: (_, triple) => IconButton(
              onPressed: () => controller.showSearchBarTriple.toggle(),
              icon: Icon(triple.state ? Icons.close : Icons.search),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          TripleBuilder<ShowSearchBarTriple, Exception, bool>(
            store: controller.showSearchBarTriple,
            builder: (_, triple) => triple.state
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBarWidget(
                      onChanged: (String value) =>
                          controller.searchTriple.update(value),
                      value: controller.searchTriple.state,
                    ),
                  )
                : Container(),
          ),
          Expanded(
            child: ScopedBuilder<CasesTriple, Exception, List<CaseEntity>>(
              store: controller.casesTriple,
              onLoading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              onError: (_, error) => Center(
                child: Text(
                  'Ocorreu um erro ao carregar!',
                  key: Key('message-error'),
                ),
              ),
              onState: (_, cases) => ListView.builder(
                itemCount: cases.length,
                itemBuilder: (_, index) => CaseCardWidget(cases[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
