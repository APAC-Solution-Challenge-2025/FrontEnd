import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CalendarDayData {
  final String date;
  final int goalAchievedCount;
  
  CalendarDayData({required this.date, required this.goalAchievedCount});

  factory CalendarDayData.fromJson(Map<String, dynamic> json) { 
    return CalendarDayData(
      date: json['date'],
      goalAchievedCount: json['goalAchievedCount'],
      ); 
    } 
  }


class CalendarProvider with ChangeNotifier {
  final Map<String, CalendarDayData> _progressByDate = {};

  Future<void> fetchCalendarData({required String jwtToken, required int year, required int month}) async {
    final String apiUrl = dotenv.env['API_CALENDAR_IP'] ?? "localhost";

    final Uri url = Uri.parse('http://$apiUrl:8080/api/calendar?year=$year&month=$month');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $jwtToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        _progressByDate.clear();

        if (jsonData['days'] != null && jsonData['days'].isNotEmpty) { 
          for (var day in jsonData['days']) {
            _progressByDate[day['date']] = CalendarDayData.fromJson(day);
          }
          notifyListeners();
        } 
      } else {
        throw Exception('Failed to fetch calendar data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching calendar data: $e');
    }
  }

  int getProgress(String date) {
    return _progressByDate[date]?.goalAchievedCount ?? -1;
  }

  void setProgress(String date, int progress) {
    if (progress >= 0 && progress <= 3) {
      if (_progressByDate.containsKey(date)) {
        _progressByDate[date] = CalendarDayData(date: date, goalAchievedCount: progress); 
      } else {
        _progressByDate[date] = CalendarDayData(date: date, goalAchievedCount: progress);
      }

      notifyListeners();
    } else {
      throw ArgumentError("Progress 값은 0~3 사이여야 합니다.");
    }
  }

  Map<String, CalendarDayData> get allProgress => _progressByDate;
}