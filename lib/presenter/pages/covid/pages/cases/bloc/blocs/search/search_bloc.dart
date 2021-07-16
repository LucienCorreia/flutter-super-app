import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBloc extends Bloc<String, String> {
  SearchBloc() : super('');

  @override
  Stream<String> mapEventToState(String search) async* {
    yield search;
  }
}
