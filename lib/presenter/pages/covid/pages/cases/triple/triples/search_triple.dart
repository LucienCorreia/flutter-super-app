import 'package:flutter_triple/flutter_triple.dart';

class SearchTriple extends StreamStore<Exception, String> {
  SearchTriple({
    String initialState = '',
  }) : super(initialState);
}
