import 'package:flutter/foundation.dart';

class CalendarData with ChangeNotifier {
  final Map<String, int> _progressByDate = {
  "2025-04-01": 0,
  "2025-04-02": 1,
  "2025-04-03": 2,
  "2025-04-04": 3,
  "2025-04-05": 0,
  "2025-04-06": 1,
  "2025-04-07": 2,
  "2025-04-08": 3,
  "2025-04-09": 0,
  "2025-04-10": 1,
  "2025-04-11": 2,
  "2025-04-12": 3,
  "2025-04-13": 0,
  "2025-04-14": 1,
  };


  int getProgress(String date) {
    return _progressByDate[date] ?? -1;
  }

  void setProgress(String date, int progress) {
    if (progress >= 0 && progress <= 3) {
      _progressByDate[date] = progress;
      notifyListeners();
    } else {
      throw ArgumentError("Progress 값은 0~3 사이여야 합니다.");
    }
  }

  Map<String, int> get allProgress => _progressByDate;
}
