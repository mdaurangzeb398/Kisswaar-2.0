// chatbot_trigger.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatbotTrigger {
  final String dialogflowWebhookUrl;

  ChatbotTrigger({required this.dialogflowWebhookUrl});

  Future<String> sendMessage(String userMessage) async {
    final response = await http.post(
      Uri.parse(dialogflowWebhookUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'queryInput': {
          'text': {
            'text': userMessage,
            'languageCode': 'en-US',
          }
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final fulfillmentText =
          data['queryResult']?['fulfillmentText'] ?? 'No response';
      return fulfillmentText;
    } else {
      throw Exception('Failed to connect to chatbot');
    }
  }
}
