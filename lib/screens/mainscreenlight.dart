import 'package:flutter/material.dart';
import 'package:weatherappupdated/const.dart';
import 'package:weatherappupdated/utils/weather.dart';
import 'package:weatherappupdated/utils/weathernews.dart';


class HomePage extends StatefulWidget {


  HomePage(this.locationName);
  late final locationName;

  @override
  State<HomePage> createState() => _HomePageState();
}
// to access the properties from HomePage to private HomePageState we have to use widget. property.

class _HomePageState extends State<HomePage> {

  WeatherModel mode = WeatherModel();

  late double temperature;
  late int condition;
  late String cityName;
  late String icon;
  late String message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationName);
  }

  void updateUI (dynamic weather) {

    setState(() {
      temperature = weather['main']['temp'];
      condition = weather['weather'][0]['id'];
      icon = mode.getWeatherIcon(condition);
      message = mode.getMessage(temperature.toInt());
      cityName = weather['name'];
    });
    // print(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      color: Color.fromRGBO(235,243,255,0.89),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    child: Text(
                      '$cityName, India',style: kfontcountry,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    child: Text(
                      'now',style: kfontnow,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wb_cloudy_sharp,
                  size: 90,
                  color: Colors.black38,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                child: Text(
                  '$temperature°',
                  style: kfonttemp,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                child: Text(
                  '$message',
                  style: kfont,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'wind',
                  style: kfontwind,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wind_power_sharp,
                  size: 18,

                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '4 m/s',
                  style: kfontwind,
                )
              ],
            ),
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(5, 5),
                    blurRadius: 12,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, -5),
                    blurRadius: 12,
                  )
                ]
              ),
              child: Column(
                children: [
                  News(),
                  SizedBox(height: 5,),
                  News(),
                  SizedBox(height: 5,),
                  News(),
                  SizedBox(height: 5,),
                  News(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
