import 'dart:convert';

import 'package:http/http.dart' as http;

class ReverseGeocodingService {
  static const baseUrl =
      'http://api.openweathermap.org/geo/1.0/reverse?limit=1&appid=eea6983fdd8aa9a36cedb975d6e65abf';

  // latlng=40.714224,-73.961452&

  Future<String?> getCityNameFromLatLng(double lat, double lng) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + 'lat=$lat&lon=$lng'));

    String cityName = json.decode(response.body)[0]['name'];

    return cityName;
  }
}
