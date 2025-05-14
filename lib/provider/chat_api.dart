import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatApi {
  final String server =
      'https://spring-backend-619167511861.asia-northeast3.run.app';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<String> sendChat({
    required String userId,
    required String prompt,
  }) async {
    final uri = Uri.parse('$server/api/chat');
    final res = await http.post(
      uri,
      headers: headers,
      body: json.encode({
        'userId': userId,
        'prompt': prompt,
      }),
    );
    if (res.statusCode == 200) {
      return res.body;
    } else {
      throw Exception('ERROR ${res.statusCode}');
    }
  }
}
