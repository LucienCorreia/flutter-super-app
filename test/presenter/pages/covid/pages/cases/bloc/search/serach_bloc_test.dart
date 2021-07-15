import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_super_app/presenter/pages/covid/pages/cases/bloc/blocs/search/search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SearchBloc', () {
    blocTest<SearchBloc, String>(
      'Should emits ["", "text"]',
      build: () => SearchBloc()..add(''),
      act: (bloc) => bloc.add('text'),
      expect: () => [
        '',
        'text',
      ],
    );
  });
}