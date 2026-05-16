import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrentService {
  final String apiKey;

  CurrentService({required this.apiKey});

  // private helper method
  Future<dynamic> _fetchJson(String urlString) async {
    final url = Uri.parse(urlString);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('HTTP Error: ${response.statusCode}');
    }
  }

  // takes a location name (as a String)
  // returns a dictionary with keys 'lat' and 'lng' for latitude and longitude
  Future<Map<String, double>> getCoordinates(String city) async {
    final data = await _fetchJson('https://maps.googleapis.com/maps/api/geocode/json?address=$city&key=$apiKey');

    if (data['status'] == 'OK') {
      final lat = data['results'][0]['geometry']['location']['lat'];
      final lng = data['results'][0]['geometry']['location']['lng'];
      return {'lat': lat, 'lng': lng};
    } else {
      throw Exception('Geocoding API error: ${data['status']}');
    }
  }

  void getCurrentWeather() async {
    
  }

  void getDailyForecast() async {
    
  }

  void getHourlyForecast() async {
    
  }
}