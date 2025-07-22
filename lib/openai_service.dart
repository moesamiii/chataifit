import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> sendMessageToGroq(String userMessage) async {
  final apiKey = dotenv.env['GROQ_API_KEY'];
  if (apiKey == null || apiKey.isEmpty) {
    return 'Missing API key';
  }

  const endpoint = 'https://api.groq.com/openai/v1/chat/completions';

  final headers = {
    'Authorization': 'Bearer $apiKey',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    "model": "llama3-8b-8192",
    "messages": [
      {
        "role": "system",
        "content": "You are a fitness coach. Only answer questions related to fitness, workouts, training, or nutrition."
      },
      {
        "role": "user",
        "content": userMessage
      }
    ],
    "temperature": 0.7,
  });

  try {
    final response = await http.post(Uri.parse(endpoint), headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['choices'][0]['message']['content'].trim();
    } else {
      return 'Failed to connect to Groq: ${response.statusCode}\n${response.body}';
    }
  } catch (e) {
    return 'Error occurred: $e';
  }
}
