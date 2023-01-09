import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherappupdated/Location.dart';
import 'package:weatherappupdated/const.dart';
import 'package:weatherappupdated/screens/mainscreenlight.dart';
import 'package:http/http.dart' as http;
import 'package:weatherappupdated/utils/Networking.dart';
import 'package:weatherappupdated/utils/Networking.dart';
import 'package:weatherappupdated/screens/mainscreenlight.dart';

const apiKey = 'bc5c7d19a5a0d8bfb3b163b6b0dfff64';



/*
*   status codes and their meaning
*   if status code starts with 1 --> Hold On
*   if status code starts with 2 --> Nothing to worry about
*   if status code starts with 3 --> Problem on my side
*   if status code starts with 4 --> Problem on server side
*/


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData () async {
    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    LocationLocator location = LocationLocator();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetWorking net = NetWorking('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    var weather = await net.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return HomePage(weather);
    }));

    Duration duration = Duration(seconds: 5);
    Future.delayed(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(235,243,255,0.89),
        child: Center(
          child: Text(
            'W E A T H E R', style: kfontcountry,
          ),
        ),

      ),
    );
  }
}
