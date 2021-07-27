import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../domain/entities/covid/case_entity.dart';
import '../../../../../widgets/load_notifier/load_notifier_builder_widget.dart';
import '../widgets/case_card_widget.dart';
import '../widgets/search_bar_widget.dart';
import 'cases_state.dart';

class CasesPage extends StatefulWidget {
  @override
  _CasesPageState createState() => _CasesPageState();
}

class _CasesPageState extends ModularState<CasesPage, CasesState> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text('Covid-19 - Cases'),
        backgroundColor: Colors.blueGrey[900],
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: controller.searchBarVisibleListenable,
            builder: (_, showSearchBar, widget) => IconButton(
              onPressed: () =>
                  controller.searchBarVisibleListenable.value = !showSearchBar,
              icon: Icon(showSearchBar ? Icons.close : Icons.search),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: controller.searchBarVisibleListenable,
            builder: (_, showSearchBar, widget) => showSearchBar
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBarWidget(
                      onChanged: (String value) =>
                          controller.textSearchListenable.value = value,
                    ),
                  )
                : Container(),
          ),
          Expanded(
            child: LoadNotifierBuilderWidget<List<CaseEntity>?>(
              valueListenable: controller.casesListenable,
              onLoading: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              onError: (_, error) => Center(
                child: Text('Ocorreu um erro ao carregar!'),
              ),
              onDone: (_, cases) => ListView.builder(
                itemCount: cases!.length,
                itemBuilder: (_, index) => CaseCardWidget(cases[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
