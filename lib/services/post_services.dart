import 'dart:convert';

import '../env/env_variable.dart';
import 'package:http/http.dart' as http;

class PostServices {
  Future<String> createResponse(String newProm) async {
    const api = DefaultApi.API;
    var uri = Uri.https('api.openai.com', '/v1/completions');

    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $api'
        },
        body: jsonEncode({
          'model': 'text-davinci-003',
          'prompt': newProm,
          'temperature': 0,
          'top_p': 1,
          'frequency_penalty': 0.0,
          'presence_penalty': 0.0
        }));

    if (response.statusCode == 200) {
      Map<String, dynamic> messageResponse = jsonDecode(response.body);
      if (messageResponse['choices'] != null &&
          messageResponse['choices'].length > 0) {
        return messageResponse['choices'][0]['text'];
      } else {
        return '';
      }
    } else {
      throw Exception(
          'Failed to create ${response.statusCode}');
    }
  }
}
