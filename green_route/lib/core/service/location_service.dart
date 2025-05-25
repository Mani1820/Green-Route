// ignore_for_file: deprecated_member_use

import 'package:geolocator/geolocator.dart';

Future<Position?> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return null;
  }

  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
      return null;
    }
  }

  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}
