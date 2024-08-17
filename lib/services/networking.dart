import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final List urlkey;
  NetworkHelper({required this.urlkey});
 
  Future getData() async {
    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': urlkey[0].toString(),
      'lon': urlkey[1].toString(),
      'appid': urlkey[2].toString(),
      'units': urlkey[3].toString()
    });
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load weather data');
      print(response.statusCode);
    }
  }
}
