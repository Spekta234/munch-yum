import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../enums/enums.dart';

class MHelperFunctions {
  static Color? getColor(String value) {
    /// Define your product specific colors here and it will match the attribute colors and show specific

    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    }else if (value == 'Brown') {
      return Colors.brown;
    }else if (value == 'Teal') {
      return Colors.teal;
    }else if (value == 'Indigo') {
      return Colors.indigo;
    }
    return null;
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
              )
            ],
          );
        }
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}___';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(i, i + rowSize > widgets.length? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static String generateOrderId() {
   final random = Random().nextInt(9000) + 1000;
   return 'MY-$random';
  }


  // Helper function to parse the date and time
  static DateTime? parseScheduledDateTime(String dateStr, String timeStr) {
    if (dateStr.isEmpty || timeStr.isEmpty) return null; // nothing to parse yet

    // Parse the date part: "24 Oct 2026"
    final dateParts = dateStr.split(' '); // ['24', 'Oct', '2026']
    final day = int.parse(dateParts[0]);
    final year = int.parse(dateParts[2]);

    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    final month = months.indexOf(dateParts[1]) + 1; // find "Oct"'s position, +1 for 1-based months

    // Parse the time part: "2:00 PM"
    final timeParts = timeStr.split(' '); // ['2:00', 'PM']
    final period = timeParts[1]; // 'AM' or 'PM'

    final hourMinute = timeParts[0].split(':'); // ['2', '00']
    int hour = int.parse(hourMinute[0]);
    final minute = int.parse(hourMinute[1]);

    // Convert 12-hour to 24-hour
    if (period == 'AM' && hour == 12) {
      hour = 0; // midnight
    } else if (period == 'PM' && hour != 12) {
      hour += 12; // any PM hour except noon itself
    }
    // 1AM–11AM and 12PM need no change — they fall through untouched

    return DateTime(year, month, day, hour, minute);
  }


  // Helper functions for enum conversions
  static OrderMode mapOrderMode(String value) {
    return value == 'Delivery' ? OrderMode.delivery : OrderMode.pickup;
  }

  static OrderingFor mapOrderingFor(String value) {
    return value == 'Someone else' ? OrderingFor.someoneElse : OrderingFor.myself;
  }

}