import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';

const String apiKey='c92228e56bd5d11ab062b56be9c561bf';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double long;
  @override
  void initState() {
    super.initState();
    getLocation();
  }
  void getLocationData() async{
    Location location=Location();
    await location.getCurrentLocation();
    long=location.long;
    lat=location.lat;

    getData();
  }
  void getData() async{

      var temperature=decodedData['main']['temp'];
      var city=decodedData["name"];
      var condition=decodedData["weather"][0]["id"];

      print(temperature);
      print(condition);
      print(city);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      ),
    );
  }
}
