import 'package:combos_tv/data/data.dart';
import 'package:combos_tv/screens/home_screen.dart';
import 'package:combos_tv/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TournamentsDisplayWidget extends StatefulWidget {
  const TournamentsDisplayWidget({super.key});

  @override
  State<TournamentsDisplayWidget> createState() =>
      _TournamentsDisplayWidgetState();
}

class _TournamentsDisplayWidgetState extends State<TournamentsDisplayWidget> {
  late dynamic tournaments = [];

  void updateList(String value) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 27,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text(
                  " Select your favorites",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    // color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (buildcontext) {
                            return AlertDialog(
                              title: const Text('Info'),
                              content: const Text(
                                  "Touch the heart in your favorites tournaments and press the SAVE button for filter the matches in the list"),
                              actions: <Widget>[
                                TextButton(
                                    child: const Text("CLOSE"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    }),
                              ],
                            );
                          });
                    },
                    icon: Icon(
                      Icons.info_outline,
                      color: kOrangeColor.withOpacity(0.8),
                    ))
              ]),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) => updateList(value),
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
                height: 8,
              ),
              Expanded(
                child: MasonryGridView.count(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  crossAxisSpacing: 15,
                  crossAxisCount: 2,
                  itemCount: products.length,
                  mainAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    return singleItemWidget(
                      products[index],
                      index == products.length - 1 ? true : false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: tournaments.isEmpty
            ? Container()
            : FloatingActionButton.extended(
                icon: const Icon(Icons.save),
                hoverElevation: 1000,
                hoverColor: kOrangeColor.withOpacity(0.8),
                backgroundColor: Colors.orange,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(
                                list: tournaments,
                              )),
                      (Route<dynamic> route) => false);
                },
                label: Row(children: const [Text("SAVE")])));
  }

  // single item widget
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
                    child: Image(
                      alignment: Alignment.center,
                      image: NetworkImage(product.productImageUrl),
                      errorBuilder: (context, error, stackTrace) {
                        return Padding(
                            padding: EdgeInsets.zero,
                            child: Image.asset(
                              // alignment: Alignment.center,
                              "assets/not.png",
                              fit: BoxFit.contain,
                            ));
                      },
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
                      products.forEach((dynamic league) {
                        if (league.isLiked == true) {
                          tournaments.add(league.productName);
                        }
                      });
                      setState(() {
                        if (product.isLiked == true) {
                          tournaments.add(product.productName);
                        } else if (product.isLiked == false) {
                          tournaments.removeWhere(
                              (element) => element == product.productName);
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
