import 'package:combos_tv/data/data.dart';
import 'package:combos_tv/screens/match.dart';
import 'package:combos_tv/utils/colors.dart';
import 'package:combos_tv/widgets/top_container.dart';
import 'package:combos_tv/widgets/tournamets_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MatchesDisplayWidget extends StatefulWidget {
  const MatchesDisplayWidget({super.key, required this.personal});
  final dynamic personal;

  @override
  State<MatchesDisplayWidget> createState() => _MatchesDisplayWidgetState();
}

class _MatchesDisplayWidgetState extends State<MatchesDisplayWidget> {
  late Map data;
  // late Map registerData;
  late List tournametsData = [];

  // late List registerTournametsData = [];

  Future getTournamets() async {
    if (widget.personal == "") {
      print("esto viene en tournamets: ${widget.personal}, por ende sera 'no'");
      String url = "http://127.0.0.1:3000/pirlo/match-page?list=no}";
      http.Response response = await http.get(Uri.parse(url));
      data = json.decode(response.body);
      setState(() {
        tournametsData = data['data'];
      });
    } else {
      print("esto viene en tournamets: ${widget.personal}");
      String url =
          "http://127.0.0.1:3000/pirlo/match-page?list=${widget.personal}";
      http.Response response = await http.get(Uri.parse(url));
      data = json.decode(response.body);
      setState(() {
        tournametsData = data['data'];
      });
    }
  }

  @override
  void initState() {
    getTournamets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: [
          TextField(
            // onChanged: (value) => updatrList(value),
            cursorColor: kOrangeColor.withOpacity(0.8),
            decoration: InputDecoration(
              filled: true,
              fillColor: kGreyColor.withOpacity(0.6),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              hintText: "Search",
              prefixIcon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 182, 182, 182),
                size: 25,
              ),
              prefixIconColor: kGreyColor,
            ),
          ),
          const SizedBox(
            width: 10,
            height: 8,
          ),
          Expanded(
            child: RefreshIndicator(
              color: kOrangeColor.withOpacity(0.8),
              onRefresh: getTournamets,
              child: ListView.builder(
                itemCount: tournametsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return singleItemWidget(
                    index,
                    index == tournametsData.length - 1 ? true : false,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // single item widget
  Widget singleItemWidget(int index, bool lastItem) {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  // color: const Color.fromARGB(0, 0, 0, 0),
                  elevation: 2,
                  child: ListTile(
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor:
                              const Color.fromARGB(99, 158, 158, 158),
                          // backgroundImage:
                          //     NetworkImage("${tournametsData[index]["img"]}"),

                          child: ClipOval(
                              child: Image.network(
                            "${tournametsData[index]["img"]}",
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/nof.PNG",
                                fit: BoxFit.contain,
                              );
                            },
                          )),
                        ),
                      ],
                    ),
                    title: Text("${tournametsData[index]["game"]}",
                        // textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        )
                        //     color: Color.fromARGB(169, 255, 255, 255)),
                        ),
                    onLongPress: () => print("long press on card"),
                    subtitle: Text(
                      "${tournametsData[index]["tournament"]}",
                      // style: const TextStyle(
                      //     color: Color.fromARGB(87, 255, 255, 255)),
                    ),
                    trailing: (tournametsData[index]["stream"]) != ""
                        ? const Icon(
                            Icons.live_tv,
                            color: Colors.orange,
                          )
                        : const Text(
                            "offline",
                            // style: TextStyle(
                            //     fontWeight: FontWeight.w800,
                            //     color: Color.fromARGB(118, 255, 255, 255)),
                          ),
                    onTap: () {
                      dynamic stream = (tournametsData[index]["stream"]);
                      dynamic game = (tournametsData[index]["game"]);
                      if ((tournametsData[index]["stream"]) != "") {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MatchScreen(
                                  title: game,
                                  stream: stream,
                                )));
                      }
                      // print("${tournametsData[index]["game"]}");
                    },
                    iconColor: Colors.orange,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height:
              lastItem == true ? MediaQuery.of(context).size.height * 0.80 : 0,
        )
      ],
    );
  }
}
