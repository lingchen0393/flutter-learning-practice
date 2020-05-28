import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDaytime'] ? Colors.blue[200] : Colors.black38 ;

    return Scaffold(
      backgroundColor: bgColor,
      //appBar: AppBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover, // full background image when use .cover
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                     dynamic result = await Navigator.pushNamed(context, '/location'); //将从choose_location中由Navigator.pop操作pop出的map存储于home page的result中
                     setState(() {
                       data = {
                         'time': result['time'],
                         'location': result['location'],
                         'flag': result['flag'],
                         'isDaytime': result['isDaytime']
                       }; // override data a new map, and rerun Widget build function
                     });
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: Colors.amber,
                    ),
                    label: Text(
                        'Edit Location',
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    )
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color : Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}