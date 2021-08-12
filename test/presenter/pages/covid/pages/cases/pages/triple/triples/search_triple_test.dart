import 'package:flutter_super_app/presenter/pages/covid/pages/cases/triple/triples/search_triple.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triple_test/triple_test.dart';

void main() {
  group('SearchTriple', () {
    storeTest<SearchTriple>(
      'Should set text for search',
      build: () => SearchTriple(),
      act: (triple) => triple.update('text'),
      expect: () => [
        '',
        'text',
      ],
    );
  });
}
