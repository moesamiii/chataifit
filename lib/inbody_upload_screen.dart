import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'openai_service.dart';

class InBodyUploadScreen extends StatefulWidget {
  const InBodyUploadScreen({super.key});

  @override
  State<InBodyUploadScreen> createState() => _InBodyUploadScreenState();
}

class _InBodyUploadScreenState extends State<InBodyUploadScreen> {
  File? _selectedImage;
  String? _feedback;
  bool _isLoading = false;

  Future<void> _pickAndUploadImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked == null) return;

    final file = File(picked.path);
    setState(() {
      _selectedImage = file;
      _isLoading = true;
      _feedback = null;
    });

    try {
      // Resize + compress image
      final resizedBase64 = await _resizeAndConvertToBase64(file);

      // Keep size safe for Groq context
      final maxBase64Length = 8000;
      final safeBase64 = resizedBase64.length > maxBase64Length
          ? resizedBase64.substring(0, maxBase64Length)
          : resizedBase64;

      // Ask for InBody analysis
      final prompt =
          "This is an InBody test screenshot. Analyze and provide feedback as a fitness expert. The image (base64 partial) is: $safeBase64";

      final reply = await sendMessageToGroq(prompt);

      setState(() {
        _feedback = reply;
      });
    } catch (e) {
      setState(() {
        _feedback = '❌ Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<String> _resizeAndConvertToBase64(File imageFile) async {
    final originalBytes = await imageFile.readAsBytes();
    final originalImage = img.decodeImage(originalBytes);

    if (originalImage == null) {
      throw Exception("Could not decode image");
    }

    // Resize to width = 300
    final resized = img.copyResize(originalImage, width: 300);

    final compressed = img.encodeJpg(resized, quality: 50);
    return base64Encode(Uint8List.fromList(compressed));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload InBody Test')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_selectedImage != null)
              Image.file(_selectedImage!, height: 250),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _pickAndUploadImage,
              icon: const Icon(Icons.upload_file),
              label: const Text('Select InBody Image'),
            ),
            const SizedBox(height: 20),
            if (_isLoading) const CircularProgressIndicator(),
            if (_feedback != null)
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _feedback!,
                    style: TextStyle(
                      color: _feedback!.startsWith('❌') ? Colors.red : Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
