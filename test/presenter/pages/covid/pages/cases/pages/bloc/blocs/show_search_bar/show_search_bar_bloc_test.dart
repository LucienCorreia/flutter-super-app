import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_super_app/presenter/pages/covid/pages/cases/bloc/blocs/show_search_bar/show_search_bloc_bar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ShowSearchBarBloc', () {
    blocTest<ShowSearchBarBloc, bool>(
      'Should emits [false, true]',
      build: () => ShowSearchBarBloc()..add(false),
      act: (bloc) => bloc.add(true),
      expect: () => [
        false,
        true,
      ],
    );
  });
}
