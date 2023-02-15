import 'package:combos_tv/screens/matches_display_screen.dart';
import 'package:combos_tv/screens/settings_screen.dart';
import 'package:combos_tv/utils/colors.dart';
import 'package:combos_tv/utils/utils.dart';
import 'package:combos_tv/widgets/matches_widget.dart';
import 'package:combos_tv/widgets/top_container.dart';
import 'package:combos_tv/widgets/tournamets_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.list,
  });
  final dynamic list;
  // dynamic names = tournaments
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  // tabbar icons
  final tabBarIcons = [
    Icons.tv_rounded,
    Icons.sports_soccer_sharp,
    Icons.manage_accounts,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                // ProductDisplayScreen(),
                // CategoryDisplayScreen(),
                // IntroScreen()
                MatchesDisplayWidget(personal: widget.list),
                // TestGamesWidget(),
                const TournamentsDisplayWidget(),
                const SettingsScreen(),
              ],
            ),

            // bottom bar
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...tabBarIcons.map(
                      (icon) => IconButton(
                        onPressed: () {
                          (Colors.black);
                          icon == Icons.tv_rounded
                              ? pageController.jumpToPage(0)
                              : icon == Icons.sports_soccer_sharp
                                  ? pageController.jumpToPage(1)
                                  : pageController.jumpToPage(3);
                        },
                        icon: Icon(icon, color: kGreyColor, size: 30),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
