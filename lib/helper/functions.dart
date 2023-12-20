import 'package:intl/intl.dart';

String moneyFormatter(String amount) {
  final formatter = NumberFormat.decimalPattern('id');
  return formatter.format(int.parse(amount));
}
