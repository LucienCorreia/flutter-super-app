import 'package:flutter_bloc/flutter_bloc.dart';

class ShowSearchBarBloc extends Bloc<bool, bool> {
  ShowSearchBarBloc() : super(false);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }
}
