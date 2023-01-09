
import 'dart:convert';

import 'package:http/http.dart' as http;


class NetWorking {

  NetWorking(this.url);

  final String url;

  Future getData () async {

    // http.Response response = await http.get('www');


    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {

      // body is all the things in the json package
      String data = response.body;
      return jsonDecode(data);

    } else {
      print(response.statusCode);
    }
  }

}