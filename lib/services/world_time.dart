import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String location; //location for the UI
  String time; //time in that location
  String flag; //url for an asset flag icon
  String url; //location url for api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties
      String datetime = data['datetime'];
      String offset = data ['utc_offset'].substring(1, 3);

      //create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property (of the class)
      time = now.toString();
    } catch(e){
      print('fama ghalta : $e');
      time = 'could not get time data';
    }


  }
}

