import 'package:intl/intl.dart';

class DateHelper {
  /// Returns date like "April 22"
  static String formatToMonthDay(DateTime date) {
    return DateFormat('MMMM d').format(date);
  }

  /// Returns date like "April 22, 2026"
  static String formatToFullDate(DateTime date) {
    return DateFormat('MMMM d, yyyy').format(date);
  }

  /// Returns time like "03:30 PM"
  static String formatToTime(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  /// Returns current date in your specific format
  static String getCurrentFormatted() {
    return formatToMonthDay(DateTime.now());
  }

  /// Converts ISO string "2026-04-22T15:35:04..." to "April 22"
  static String formatIsoToMonthDay(String isoString) {
    try {
      DateTime parsedDate = DateTime.parse(isoString);
      return DateFormat('MMMM d').format(parsedDate);
    } catch (e) {
      return "Invalid Date";
    }
  }

  /// Extract: 3:35 PM
  static String extractTime(String isoString) {
    DateTime parsed = DateTime.parse(isoString);
    return DateFormat('h:mm a').format(parsed);
  }

  /// Extract 24-hour format: 15:35
  static String extractTime24h(String isoString) {
    DateTime parsed = DateTime.parse(isoString);
    return DateFormat('HH:mm').format(parsed);
  }
}
