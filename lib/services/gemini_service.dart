import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final String apiKey;
  late final GenerativeModel _model;

  GeminiService({required this.apiKey}) {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: apiKey,
    );
  }

  // private helper method
  Future<String> _generateText(String prompt) async {
    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);

      if (response.text != null && response.text!.isNotEmpty) {
        return response.text!;
      } else {
        throw Exception('Gemini returned an empty response.');
      }
    } catch (e) {
      throw Exception('Error communicating with Gemini: $e');
    }
  }

  generateTripSummary() async {
    throw UnimplementedError();
  }

  generateStretchSummary() async {
    throw UnimplementedError();
  }

  generateDaySummary() async {
    throw UnimplementedError();
  }

  generateFeelsLikeBadge() async {
    throw UnimplementedError();
  }
}