import 'dart:ui';

import 'package:flutter/material.dart';

class home extends StatefulWidget {

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override


  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;  //  receiving data from the widget

    String bgImg = data['isDay'] ? 'dayy.jpg' : 'night.png';
    Color bgCol = data['isDay'] ? Colors.deepPurpleAccent : Colors.black54;

    return Scaffold(
      backgroundColor: bgCol,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0,100.0,0.0,50.0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context,'/location');
                    if(result != null){
                      setState(() {
                        data = {
                          'time': result['time'],
                          'loc': result['loc'],
                          'isDay': result['isDay'],
                          'flg': result['flg']
                          };
                        }
                      );
                    }
                  },
                    icon: Icon(Icons.edit_location,
                      color: Colors.black,
                    ),
                    label: Text(
                        'Edit location ',
                        style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                   ),
                ),
                SizedBox(height: 10.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(data['loc'],
                           style: TextStyle(
                           fontSize: 50.0,
                           letterSpacing: 1,
                           color: Colors.black,
                         ),
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 90.0),
                Text(data['time'],
                style: TextStyle(
                  fontSize: 75.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
