import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'openai_service.dart';
import 'inbody_upload_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Add a welcoming message from the assistant
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _messages.add({
          'role': 'assistant',
          'content': 'Welcome! I\'m your AI fitness coach. You can ask me anything about workouts, nutrition, or upload your InBody scan for analysis.'
        });
      });
    });
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'content': text});
      _isLoading = true;
      _controller.clear();
    });

    final reply = await sendMessageToGroq(text);

    setState(() {
      _messages.add({'role': 'assistant', 'content': reply});
      _isLoading = false;
    });
  }

  Future<void> _handleInBodyUpload() async {
    final File? image = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const InBodyUploadScreen()),
    );

    if (image != null) {
      setState(() {
        _messages.add({'role': 'user', 'content': '[Uploaded InBody Image]'});
        _isLoading = true;
      });

      final bytes = await image.readAsBytes();
      final base64Image = base64Encode(bytes);

      final aiPrompt = '''
I uploaded an InBody scan as a photo. Please analyze the body composition information and give me a detailed interpretation.
Base64 Image: $base64Image
''';

      final reply = await sendMessageToGroq(aiPrompt);

      setState(() {
        _messages.add({'role': 'assistant', 'content': reply});
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fitness Coach Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['role'] == 'user';

                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message['content'] ?? '',
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(12),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.image),
                  tooltip: 'Upload InBody',
                  onPressed: _handleInBodyUpload,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ask your fitness coach...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
