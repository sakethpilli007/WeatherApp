import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/services/maps_service.dart';

void main() {
  late MapsService mapsService;
  setUpAll(() {
    final envFileString = File('.env').readAsStringSync();
    dotenv.loadFromString(envString: envFileString);
    final apiKey = dotenv.env['MAPS_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('TEST SETUP FAILED: GOOGLE_MAPS_API_KEY not found in .env');
    }
    mapsService = MapsService(apiKey: apiKey);
  });

  test('getCoordinates returns and prints lat and lng for Cambridge', () async {
    final coords = await mapsService.getCoordinates('Cambridge');

    expect(coords['lat'], isNotNull);
    expect(coords['lng'], isNotNull);

    print('Latitude: ${coords['lat']}');
    print('Longitude: ${coords['lng']}');
  });
}