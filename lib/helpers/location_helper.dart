import 'dart:convert';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = '';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double latitude = 0, double longitude = 0}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double long) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json/latlng=$lat,$long?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly');
    final response = await http.get(url);

    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
