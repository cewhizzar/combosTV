import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String valor = "";
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          // User card

          SettingsGroup(
            settingsGroupTitle: " Settings",
            items: [
              SettingsItem(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (buildcontext) {
                        return AlertDialog(
                          title: const Text('Suggestion'),
                          content: const TextField(
                            decoration: InputDecoration(
                                filled: true,
                                labelText: "ex: Add Premier League"),
                          ),
                          actions: <Widget>[
                            TextButton(
                                child: const Text("SEND"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          ],
                        );
                      });
                },
                icons: CupertinoIcons.pencil_outline,
                iconStyle: IconStyle(backgroundColor: Colors.orange),
                title: 'Suggestion',
                subtitle: "Leave your comment or suggestion",
              ),
              SettingsItem(
                onTap: () {},
                icons: Icons.dark_mode_rounded,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.orange,
                ),
                title: 'Dark mode',
                subtitle: "Automatic",
                trailing: Switch.adaptive(
                  value: true,
                  onChanged: (value) {
                    value = !value;
                  },
                ),
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (buildcontext) {
                        return AlertDialog(
                          title: const Text('About'),
                          content: const Text(
                              "Combos TV it's your soccer place and point."),
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
                icons: Icons.info_rounded,
                iconStyle: IconStyle(
                  backgroundColor: Colors.orange,
                ),
                title: 'About',
                subtitle: "Learn more about us",
              ),
            ],
          ),
          // You can add a settings title
          // SettingsGroup(
          //   settingsGroupTitle: "Go out",
          //   items: [
          //     SettingsItem(
          //       onTap: () {},
          //       icons: Icons.exit_to_app_rounded,
          //       title: "Sign Out",
          //     ),
          //   ],
          // ),
          SettingsGroup(
            items: [],
          )
        ],
      ),
    );
  }
}
