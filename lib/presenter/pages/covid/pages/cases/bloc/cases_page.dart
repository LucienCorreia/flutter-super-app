import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'cases_state.dart';
import 'blocs/show_search_bar/show_search_bloc_bar.dart';
import 'blocs/cases/cases_bloc.dart';
import 'blocs/cases/cases_bloc_states.dart';
import '../widgets/case_card_widget.dart';
import '../widgets/search_bar_widget.dart';

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
          BlocBuilder<ShowSearchBarBloc, bool>(
            bloc: controller.showSearchBarBloc,
            builder: (_, state) => IconButton(
              onPressed: () => controller.showSearchBarBloc.add(!state),
              icon: Icon(state ? Icons.close : Icons.search),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<ShowSearchBarBloc, bool>(
            bloc: controller.showSearchBarBloc,
            builder: (_, state) => state
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SearchBarWidget(
                        value: controller.searchBloc.state,
                        onChanged: (String search) {
                          controller.casesBloc.add(search);
                          controller.searchBloc.add(search);
                        }),
                  )
                : Container(),
          ),
          Expanded(
            child: BlocBuilder<CasesBloc, CasesBlocState>(
              bloc: controller.casesBloc,
              builder: (_, state) {
                if (state is CasesBlocStateFailure) {
                  return Center(
                    child: Text('Ocorreu um erro ao carregar!'),
                  );
                }

                if (state is CasesBlocStateLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final cases = (state as CasesBlocStateLoaded).cases;

                return ListView.builder(
                  itemCount: cases.length,
                  itemBuilder: (context, index) => CaseCardWidget(cases[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
