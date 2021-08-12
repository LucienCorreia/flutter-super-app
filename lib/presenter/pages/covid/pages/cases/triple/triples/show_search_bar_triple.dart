import 'package:flutter_triple/flutter_triple.dart';

class ShowSearchBarTriple extends StreamStore<Exception, bool> {
  ShowSearchBarTriple({
    bool initialState = false,
  }) : super(initialState);

  void toggle() {
    update(!state);
  }
}
