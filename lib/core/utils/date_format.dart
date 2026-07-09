import 'package:intl/intl.dart';

class DateFormatHelper {
  static String format(DateTime date, String locale) {
    final dateFormating = locale == "ar"
        ? DateFormat("EEEE, dd MMMM yyyy, h:mm a", "ar").format(date)
        : DateFormat("EEEE, dd MMMM yyyy, h:mm a", "en").format(date);
    return dateFormating;
  }
}
