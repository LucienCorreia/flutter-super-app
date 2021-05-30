
import 'package:intl/intl.dart';

extension NumberFormatHelper on num {
  String get decimal => NumberFormat.currency(
        decimalDigits: 0,
        locale: 'pt_BR',
        name: 'BRL',
        symbol: '',
      ).format(this).trim();
}