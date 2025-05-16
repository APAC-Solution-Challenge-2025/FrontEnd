import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ReportProvider with ChangeNotifier {
  String _date = "";
  List<Map<String, dynamic>> _healthStatus = [];
  String _recommendedSolution = "";
  List<Map<String, dynamic>> _goals = [];

  // 날짜별 데이터를 저장할 맵
  final Map<String, Map<String, dynamic>> _reportsByDate = {};

  Future<Map<String, dynamic>> fetchDailyReport({
    required String jwtToken,
    required int year,
    required int month,
    required int day,
  }) async {
    final String apiUrl = dotenv.env['API_IP'] ?? "localhost";
    final Uri url = Uri.parse(
      'http://$apiUrl:8080/api/calendar/report?year=$year&month=$month&day=$day',
    );

    try {
      final response = await http.get(
        url,
        headers: {
          "Authorization": "Bearer $jwtToken",
          "Content-Type": "application/json",
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Failed to fetch daily report: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Error fetching data: $error");
    }
  }

  void clearReportData() {
    _healthStatus = [];
    _recommendedSolution = '';
    _goals = [];
    notifyListeners();
  }

  void updateGoals(List<Map<String, dynamic>> newGoals) {
    _goals = newGoals;
    notifyListeners();
  }

  void updateReportDataForDate(String date, Map<String, dynamic> data) {
    _reportsByDate[date] = data;
    _date = data["date"];
    _healthStatus = List<Map<String, dynamic>>.from(data["healthStatus"]);
    _recommendedSolution = data["recommendedSolution"];
    _goals = List<Map<String, dynamic>>.from(data["goals"]);
    notifyListeners();
  }

  Map<String, dynamic>? getReportDataForDate(String date) {
    return _reportsByDate[date];
  }

  void toggleGoalCompletion(int index) {
    _goals = List<Map<String, dynamic>>.from(_goals);
    _goals[index] = Map<String, dynamic>.from(_goals[index]);
    _goals[index]["achieved"] = !_goals[index]["achieved"];
    notifyListeners();
  }

  void updateReportData(Map<String, dynamic> responseData) {
    _date = responseData["date"];
    _healthStatus = List<Map<String, dynamic>>.from(responseData["healthStatus"]);
    _recommendedSolution = responseData["recommendedSolution"];
    _goals = List<Map<String, dynamic>>.from(responseData["goals"]);
    notifyListeners();
  }

  // 새로 추가: 특정 날짜 데이터 서버에서 가져와서 업데이트
  Future<void> loadGoalsForDate({
    required String jwtToken,
    required DateTime date,
  }) async {
    try {
      final data = await fetchDailyReport(
        jwtToken: jwtToken,
        year: date.year,
        month: date.month,
        day: date.day,
      );
      updateReportDataForDate(date.toIso8601String(), data);
    } catch (e) {
      clearReportData();
    }
  }

  // Getters
  String get date => _date;
  List<Map<String, dynamic>> get healthStatus => _healthStatus;
  String get recommendedSolution => _recommendedSolution;
  List<Map<String, dynamic>> get goals => _goals;
}
