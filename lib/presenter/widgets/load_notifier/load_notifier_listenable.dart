import 'package:flutter/foundation.dart';

import 'load_notifier_state.dart';

///
/// Initialized with state 'loading'
///
/// On set value, state is changed for 'done'
///
class LoadNotifierListenable<T> extends ChangeNotifier
    implements ValueListenable<T> {
  T _value;

  Object _error = Error();

  LoadNotifierState _state = LoadNotifierState.loading;

  LoadNotifierListenable(this._value);

  @override
  T get value => _value;

  Object get error => _error;

  LoadNotifierState get state => _state;

  set value(T newValue) {
    _state = LoadNotifierState.done;

    if (newValue != _value) {
      _value = newValue;

      notifyListeners();
    }
  }

  set state(LoadNotifierState state) {
    _state = state;
    notifyListeners();
  }

  void setLoading() {
    _state = LoadNotifierState.loading;
    notifyListeners();
  }

  void setError(Object error) {
    _error = error;
    _state = LoadNotifierState.error;
    notifyListeners();
  }
}
