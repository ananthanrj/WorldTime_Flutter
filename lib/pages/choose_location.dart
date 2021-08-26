import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';


class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {

  List<worldtime> locations = [
    worldtime(url: 'Asia/kolkata', loc: 'Kolkata', flg: 'ind.png'),
    worldtime(url: 'Europe/London', loc: 'London', flg: 'uk.png'),
    worldtime(url: 'Asia/Dubai', loc: 'Dubai', flg: 'UAE.jpg'),
    worldtime(url: 'Pacific/Auckland', loc: 'Auckland', flg: 'nz.png'),
    worldtime(url: 'Europe/Berlin', loc: 'Berlin', flg: 'germany.png'),
    worldtime(url: 'America/New_York', loc: 'New York', flg: 'usa.png'),
    worldtime(url: 'Asia/Seoul', loc: 'Seoul', flg: 'south_korea.png'),
  ];

  void updateTime(index) async {
    worldtime instance = locations[index];
    await instance.gettime();
    Navigator.pop(context, {
      'loc': instance.loc,
      'time': instance.time,
      'flg': instance.flg,
      'isDay': instance.isDay,
      }
    );
  }

  @override
  void initState()
  {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Choose a Location",
          style: TextStyle(
            letterSpacing: 1.5
          ),
        ),
        centerTitle: true ,
      ),

      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].loc),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flg}'),
                  ),
                ),
              ),
            );
          }
        ),
    );
  }
}
