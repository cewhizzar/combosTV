import 'package:combos_tv/utils/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

const kTitleStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  color: Colors.white,
);

const kNormalStyle = TextStyle(
  fontSize: 15,
  height: 1.3,
  color: Colors.black,
  fontWeight: FontWeight.w600,
);

// building the indicators
List<Widget> buildIndicators() {
  List<Widget> list = [];
  for (int i = 0; i < 4; i++) {
    list.add(i == 1 ? indicator(true) : indicator(false));
  }
  return list;
}

Widget indicator(bool isActive) {
  return AnimatedContainer(
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    duration: const Duration(microseconds: 150),
    height: 8.0,
    width: isActive ? 30.0 : 8.0,
    decoration: BoxDecoration(
      color: isActive ? kOrangeColor : Colors.grey,
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

late Map data;
// late Map registerData;
late dynamic tournametsData;

// late List registerTournametsData = [];

Future getTournametss(String personal) async {
  print("esto viene en tournamets: $personal");
  String url = "http://127.0.0.1:3000/pirlo/match-page?list=$personal";
  http.Response response = await http.get(Uri.parse(url));
  data = json.decode(response.body);

  tournametsData = data['data'];
  return tournametsData;
}
