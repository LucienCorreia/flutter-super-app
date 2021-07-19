import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cases_state.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/case_card_widget.dart';

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
        actions: [
          Observer(
            builder: (_) => IconButton(
              onPressed: () {
                controller.showSearchBar = !controller.showSearchBar;
                controller.setTextSearch = '';
              },
              icon: Icon(controller.showSearchBar ? Icons.close : Icons.search),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) => controller.showSearchBar
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBarWidget(
                      onChanged: (String value) =>
                          controller.setTextSearch = value,
                    ),
                  )
                : Container(),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (controller.error != null) {
                  return Center(
                    child: Text('${controller.error}'),
                  );
                }

                if (controller.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.builder(
                  itemCount: controller.searchedCases.length,
                  itemBuilder: (_, index) =>
                      CaseCardWidget(controller.searchedCases[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
