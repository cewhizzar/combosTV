import 'package:combos_tv/utils/colors.dart';
import 'package:combos_tv/widgets/matches_widget.dart';
import 'package:combos_tv/widgets/top_container.dart';
import 'package:combos_tv/widgets/tournamets_widget.dart';
import 'package:flutter/material.dart';

class MatchesDisplayScreen extends StatefulWidget {
  const MatchesDisplayScreen({super.key});

  @override
  State<MatchesDisplayScreen> createState() => _MatchesDisplayScreenState();
}

class _MatchesDisplayScreenState extends State<MatchesDisplayScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedValue = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: [
          const TopContainer(
            tabBarValue: 1,
            searchBarTitle: "Search",
          ),

          // tab bar and tab views
          TabBar(
            splashBorderRadius: BorderRadius.circular(30),
            controller: tabController,
            indicatorColor: kOrangeColor.withOpacity(0.8),
            labelColor: Colors.white,
            unselectedLabelColor: kBackgroundColor,
            indicatorSize: TabBarIndicatorSize.label,
            onTap: (value) {
              setState(() {
                selectedValue = value;
                print(selectedValue);
              });
              tabController.animateTo(value);
            },
            tabs: [
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: selectedValue == 0
                        ? kBackgroundColor
                        : kGreyColor.withOpacity(0.8),
                    boxShadow: selectedValue == 0
                        ? [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(0, 1))
                          ]
                        : null),
                child: const Text(
                  "Matches",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: selectedValue == 1
                        ? kBackgroundColor
                        : kGreyColor.withOpacity(0.8),
                    boxShadow: selectedValue == 1
                        ? [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(0, 1))
                          ]
                        : null),
                child: const Text(
                  "Tournaments",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          // tab view
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                MatchesDisplayWidget(
                  personal: "no",
                ),
                TournamentsDisplayWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
