import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationProvider with ChangeNotifier {
  bool _allNotificationsEnabled = false;
  bool _morningCheckInEnabled = false;
  bool _goalRemindersEnabled = false;

  bool get allNotificationsEnabled => _allNotificationsEnabled;
  bool get morningCheckInEnabled => _morningCheckInEnabled;
  bool get goalRemindersEnabled => _goalRemindersEnabled;

  NotificationProvider() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _loadPreferences();
    await checkStoredKeys();
  }

  Future<void> checkStoredKeys() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Set<String> keys = prefs.getKeys();
  debugPrint("🔍 저장된 모든 키: $keys");
}

  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _allNotificationsEnabled = prefs.getBool('allNotificationsEnabled') ?? true;
    _morningCheckInEnabled = prefs.getBool('morningCheckInEnabled') ?? true;
    _goalRemindersEnabled = prefs.getBool('goalRemindersEnabled') ?? true;
    debugPrint("🔍 로드된 값1: $_allNotificationsEnabled");
    debugPrint("🔍 로드된 값2: $_morningCheckInEnabled");
    debugPrint("🔍 로드된 값3: $_goalRemindersEnabled");
    notifyListeners();
  }

  void toggleAll(bool value) async {
    _allNotificationsEnabled = value;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('allNotificationsEnabled', value);
    debugPrint("🔍 저장된 값: $value");

  }

  void toggleMorningCheckIn(bool value) async {
    _morningCheckInEnabled = value;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('morningCheckInEnabled', value);
    debugPrint("🔍 저장된 값: $value");

  }

  void toggleGoalReminders(bool value) async {
    _goalRemindersEnabled = value;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('goalRemindersEnabled', value);
    debugPrint("🔍 저장된 값: $value");
  }
}