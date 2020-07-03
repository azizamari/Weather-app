import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


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
    getLocationData();
  }
  void getLocationData() async{
    Location location=Location();
    await location.getCurrentLocation();
    long=location.long;
    lat=location.lat;

    NetworkHelper networkHelper=NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey");
    var weatherData=await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitThreeBounce(
          size: 50,
          color:  Colors.white,
        ),
      ),
    );
  }
}
