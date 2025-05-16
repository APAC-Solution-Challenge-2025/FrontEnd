import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_input_data_model.dart';

class UserDataApi {
  final String server =
      'https://spring-backend-619167511861.asia-northeast3.run.app';

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<void> sendUserData({
    required String email,
    required UserInputData data,
  }) async {
    final uri = Uri.parse('$server/api/health-data')
        .replace(queryParameters: {'email': email});

    final res = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(data.toJson()),
    );

    if (res.statusCode != 200) {
      throw Exception('Failed to send user data: ${res.statusCode}');
    }
  }
}
