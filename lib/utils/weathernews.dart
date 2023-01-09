import 'package:flutter/material.dart';
import 'package:weatherappupdated/const.dart';


class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.wb_cloudy_rounded,
            size: 26,
            color: Colors.black26,
          ),
          Text(
            '11°0°',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                color: Colors.black,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500
            ),
          ),
          Text(
            'Mon, June 27',
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                color: Colors.black,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w500,
            ),
          ),

        ],
      ),
    );
  }
}




