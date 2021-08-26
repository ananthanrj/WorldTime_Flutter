import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldtime{

   String loc;
   String flg;
   String url;
   bool isDay  = true;

   worldtime({required this.loc, required this.flg, required this.url});

   String time ="Please Wait";
   Future<void> gettime() async
   {
      try {

         Uri apiUrl = Uri.parse('https://worldtimeapi.org/api/timezone/$url');  //getting data from the api
         Response response = await get(apiUrl);
         Map data = jsonDecode(response.body);

         String datetime = data['datetime'];
         String offset = data['utc_offset'].substring(1, 3);

         DateTime present = DateTime.parse(datetime);
         present = present.add(Duration(hours: int.parse(offset)));

         isDay = present.hour > 5 && present.hour < 19 ? true : false;
         time = DateFormat.jm().format(present);      // Formatting the time
      }
      catch(e){
         print(e);
         time= 'Error in getting data ';
      }
   }
}