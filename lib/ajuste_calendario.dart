import 'package:flutter/foundation.dart';

class CalendarSettings extends ChangeNotifier {
  int _calendarType = 1; // 1 for with icon, 2 for without header

  int get calendarType => _calendarType;


  void setCalendarType(int type) {
    _calendarType = type;
    notifyListeners(); // Notify listeners when the value changes
  }
}