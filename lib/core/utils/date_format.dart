import 'package:intl/intl.dart';

class DateFormatHelper {
  static String format(DateTime date, String locale) {
    final dateFormating = locale == "ar"
        ? DateFormat("EEEE, dd MMMM yyyy, HH:mm", "ar").format(date)
        : DateFormat("EEEE, dd MMMM yyyy, HH:mm", "en").format(date);
    return dateFormating;
  }
}
