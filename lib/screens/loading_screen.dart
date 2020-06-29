import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

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
  void getLocation() async{
    Location location=Location();
    await location.getCurrentLocation();
    long=location.long;
    lat=location.lat;

    getData();
  }
  void getData() async{
    Response response=await get('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');
    if(response.statusCode==200){
      String data = response.body;

      var decodedData=jsonDecode(data);

      var temperature=decodedData['main']['temp'];
      var city=decodedData["name"];
      var condition=decodedData["weather"][0]["id"];

      print(temperature);
      print(condition);
      print(city);

    }else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      ),
    );
  }
}
