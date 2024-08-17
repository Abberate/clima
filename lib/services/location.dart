import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {

  Location({this.latitude, this.longitude});

  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    if (await _checkLocationPermission()) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
      } catch (e) {
        print("Error getting location: $e");
      }
    } else {
      print("Location permission denied.");
    }
  }

  Future<bool> _checkLocationPermission() async {
    if (await Permission.location.isGranted) {
      return true;
    } else {
      // Request permission
      var status = await Permission.location.request();
      return status.isGranted;
    }
  }
}


/*  Future<void> getLocation() async {
    if (await _checkLocationPermission()) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        print(position);
      } catch (e) {
        print("Error getting location: $e");
      }
    } else {
      print("Location permission denied.");
    }
  }

  Future<bool> _checkLocationPermission() async {
    if (await Permission.location.isGranted) {
      return true;
    } else {
      // Request permission
      var status = await Permission.location.request();
      return status.isGranted;
    }
  }*/