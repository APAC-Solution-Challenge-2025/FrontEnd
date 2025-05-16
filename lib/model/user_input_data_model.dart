class UserInputData {
  List<String> userType = [];
  List<String> hobbies = [];
  List<String> conditions = [];
  List<String> birthDate = [];
  List<String> birthMethod = [];

  Map<String, dynamic> toJson() => {
        'healthStatus': {
          'userType': userType,
          'hobbies': hobbies,
          'condition': conditions,
          'birthDate': birthDate,
          'birthMethod': birthMethod,
        },
      };
}
