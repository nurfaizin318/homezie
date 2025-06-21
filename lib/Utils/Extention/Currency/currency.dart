import 'package:intl/intl.dart';

class CurrencyConverter {

static String formatRupiah(int amount) {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return formatter.format(amount);
}

  static double parseCurrency(String formatted) {
    try {
      final value = formatted
          .replaceAll(RegExp(r'[^\d]'), '')
          .replaceAll(RegExp(r'^0+(?!$)'), '');
      return double.parse(value) / 100;
    } catch (e) {
      return 0.0;
    }
  }
}
