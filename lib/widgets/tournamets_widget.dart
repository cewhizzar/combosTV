import 'package:combos_tv/data/data.dart';
import 'package:combos_tv/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TournamentsDisplayWidget extends StatefulWidget {
  const TournamentsDisplayWidget({super.key});

  @override
  State<TournamentsDisplayWidget> createState() =>
      _TournamentsDisplayWidgetState();
}

class _TournamentsDisplayWidgetState extends State<TournamentsDisplayWidget> {
  late List<String> tournaments = [];
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
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
    );
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
