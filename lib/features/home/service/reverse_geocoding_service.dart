import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ReverseGeocodingService {
  static const baseUrl =
      'http://api.openweathermap.org/geo/1.0/reverse?limit=1&appid=32121b79202df080d5581bccf04679e1&';

  // latlng=40.714224,-73.961452&

  Future<String?> getCityNameFromLatLng(double lat, double lng) async {
    http.Response response =
        await http.get(Uri.parse(baseUrl + 'lat=$lat&lon=$lng'));

    log(response.body.toString());

    String cityName = json.decode(response.body)[0]['name'];
    String country = json.decode(response.body)[0]['country'];

    return '$cityName, $country';
  }
}
