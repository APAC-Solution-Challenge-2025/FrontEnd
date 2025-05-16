import 'package:flutter/material.dart';
import '/model/user_input_data_model.dart';

class UserInputDataProvider extends ChangeNotifier {
  String userId = '';
  final UserInputData userData = UserInputData();

  UserInputData get data => userData;

  void setUserId(String id) {
    userId = id;
    notifyListeners();
  }

  void setUserType(List<String> type) {
    userData.userType = type;
    notifyListeners();
  }

  void setHobbies(List<String> hobbies) {
    userData.hobbies = hobbies;
    notifyListeners();
  }

  void setCondition(List<String> conditions) {
    userData.conditions = conditions;
    notifyListeners();
  }

  void setBirthDate(List<String> date) {
    userData.birthDate = date;
    notifyListeners();
  }

  void setBirthMethod(List<String> method) {
    userData.birthMethod = method;
    notifyListeners();
  }
}
