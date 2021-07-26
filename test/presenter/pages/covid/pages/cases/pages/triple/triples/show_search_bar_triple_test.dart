import 'package:flutter_super_app/presenter/pages/covid/pages/cases/triple/triples/show_search_bar_triple.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triple_test/triple_test.dart';

void main() {
  group('ShowSearchBarTriple', () {
    storeTest<ShowSearchBarTriple>(
      'Should toggle value',
      build: () => ShowSearchBarTriple(),
      act: (triple) => triple.toggle(),
      expect: () => [
        false,
        true,
      ],
    );
  });
}
