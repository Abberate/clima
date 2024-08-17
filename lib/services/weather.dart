import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '33eb85ad5466cc26e3114164c04f2fac';
const unit ='metric';

class WeatherModel {

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper =
    NetworkHelper(urlkey: [location.latitude, location.longitude, apiKey,unit]);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 45) {
      return 'C\'est l\'heure de la 🍦';
    } else if (temp > 35) {
      return 'Il est temps de mettre un short et un 👕';
    } else if (temp < 20) {
      return 'Vous aurez besoin d\'une 🧣 et de 🧤';
    } else {
      return 'Prenez un 🧥 juste au cas où';
    }
  }

}
