import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String get formattedMD => DateFormat('d MMMM').format(this);
  String get formattedHMin => DateFormat('HH:mm').format(this);
}
