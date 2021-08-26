import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {


  void setup() async{
    worldtime instance = worldtime(loc: 'Kolkata', flg: 'ind.png', url: 'Asia/kolkata');
    await instance.gettime();
    Navigator.pushReplacementNamed(context, '/home' , arguments: {
      'loc' : instance.loc,
      'flg' : instance.flg,
      'time' : instance.time,
      'isDay' : instance.isDay,

      }
    );  // Sending data from one widget to another
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
         child: SpinKitDualRing(
            color: Colors.black,
            size: 65.0,
          ),
      )
    );
  }
}
