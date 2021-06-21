import 'package:flutter_super_app/presenter/widgets/load_notifier/load_notifier_listenable.dart';
import 'package:flutter_super_app/presenter/widgets/load_notifier/load_notifier_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoadNotifierListenable', () {
    group('State', () {
      final loadNotifierListenable = LoadNotifierListenable<int>(0);

      test('The state must be loading ', () {
        // loading on init
        expect(loadNotifierListenable.state, LoadNotifierState.loading);

        // set loading with setting state
        loadNotifierListenable.state = LoadNotifierState.loading;

        expect(loadNotifierListenable.state, LoadNotifierState.loading);

        // set load with method setLoading()
        loadNotifierListenable.setLoading();

        expect(loadNotifierListenable.state, LoadNotifierState.loading);
      });

      test('The state must be done and value is 1', () {
        loadNotifierListenable.value = 1;

        expect(loadNotifierListenable.state, LoadNotifierState.done);
        expect(loadNotifierListenable.value, equals(1));
      });

      test('The state must be error', () {
        final exception = Exception('Error');

        loadNotifierListenable.setError(exception);

        expect(loadNotifierListenable.state, LoadNotifierState.error);
        expect(loadNotifierListenable.error, equals(exception));
        expect(loadNotifierListenable.value, equals(1));
      });
    });
  });
}
