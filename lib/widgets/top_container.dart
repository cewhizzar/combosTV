import 'package:combos_tv/utils/colors.dart';
import 'package:combos_tv/utils/utils.dart';
import 'package:combos_tv/data/data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:cached_network_image/cached_network_image.dart';

class TopContainer extends StatefulWidget {
  final dynamic tabBarValue;
  final String searchBarTitle;
  const TopContainer({
    super.key,
    required this.tabBarValue,
    required this.searchBarTitle,
  });

  @override
  State<TopContainer> createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  List<Product> tournamentList = List.from(products);

  void updatrList(String value) {
    setState(() {
      tournamentList = products
          .where((element) =>
              element.productName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) => updatrList(value),
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
            height: 20,
          )
        ],
      ),
    );
  }
}
