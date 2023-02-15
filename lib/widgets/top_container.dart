import 'package:combos_tv/utils/colors.dart';
import 'package:combos_tv/utils/providerTournaments.dart';
import 'package:combos_tv/utils/utils.dart';
import 'package:combos_tv/data/data.dart';
import 'package:combos_tv/widgets/tournamets_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "package:combos_tv/widgets/tournamets_widget.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  late List<String> tournaments = [];

  List<Product> display_tournament = List.from(products);

  void updatrList(String value) {
    setState(() {
      display_tournament = products
          .where((element) => element.tournamentname!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: MasonryGridView.count(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              crossAxisSpacing: 15,
              crossAxisCount: 2,
              itemCount: display_tournament.length,
              mainAxisSpacing: 10,
              itemBuilder: (context, index) {
                return singleItemWidget(
                  display_tournament[index],
                  index == display_tournament.length - 1 ? true : false,
                );
              },
            ),
          )
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.0,
          // )
        ])));
    //           Expanded(
    //             child: GridView.count(
    //               crossAxisCount: 2,
    //               children: List.generate(display_tournament.length, ((index) {
    //                 return TournametItem(
    //                     display_tournament[index].tournamentimg!,
    //                     display_tournament[index].tournamentname!,
    //                     display_tournament[index].isLiked!,
    //                     index);
    //               })),
    //             ),
    //           ),
    //         ]),
    //   )),
    // );
  }

  Widget singleItemWidget(Product product, bool lastItem) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: const Color.fromARGB(99, 158, 158, 158),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(1, 1),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                      bottomLeft: Radius.circular(13),
                      bottomRight: Radius.circular(13),
                    ),
                    // BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: product.productImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 5,
              top: 10,
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: product.isLiked
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.orange,
                            size: 15,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: Colors.grey,
                            size: 15,
                          ),
                    onPressed: () {
                      product.isLiked = !product.isLiked;
                      setState(() {
                        if (product.isLiked == true) {
                          tournaments.add(product.productName);
                          print(tournaments);
                        } else if (product.isLiked == false) {
                          tournaments.removeWhere(
                              (element) => element == product.productName);
                          print(tournaments);
                        }
                      });
                    },
                  )),
            )
          ],
        ),
        SizedBox(
          height:
              lastItem == true ? MediaQuery.of(context).size.height * 0.50 : 0,
        )
      ],
    );
  }
}
