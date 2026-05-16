import 'dart:convert';
import 'package:http/http.dart' as http;

class ClimateService {
  ClimateService();

  // private helper method
  Future<dynamic> _fetchJson(String urlString) async {
    final url = Uri.parse(urlString);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Open-Meteo Archive HTTP Error: ${response.statusCode}');
    }
  }

  void getSeasonalStretchData() async {
    throw UnimplementedError();
  }
}