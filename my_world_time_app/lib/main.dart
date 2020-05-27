import 'package:flutter/material.dart';
import 'package:myworldtimeapp/pages/home.dart';
import 'package:myworldtimeapp/pages/loading.dart';
import 'package:myworldtimeapp/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      }
  ));
}

