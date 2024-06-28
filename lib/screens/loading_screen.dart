import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Future<void> getLocation() async {
    // Check and request location permission if not granted
    if (await _checkLocationPermission()) {
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        print(position);
      } catch (e) {
        print("Error getting location: $e");
        // Handle error getting location
      }
    } else {
      // Handle case when location permission is not granted
      // You can show a dialog or a snackbar to inform the user
      // and provide them with an option to grant the permission.
      // For simplicity, we are printing an error message here.
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

/*  void getLocation() {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            getLocation();
          },
          child: Text('Get Location',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
