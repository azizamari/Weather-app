import 'package:geolocator/geolocator.dart';
class Location{
  double long;
  double lat;
   Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      lat=position.latitude;
      long=position.longitude;
    }
    catch (e) {
      print(e);
    }
  }
}