import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          // User card

          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: CupertinoIcons.pencil_outline,
                iconStyle: IconStyle(backgroundColor: Colors.orange),
                title: 'Edit',
                subtitle: "Select yours",
              ),
              SettingsItem(
                onTap: () {
                  
                },
                icons: Icons.dark_mode_rounded,
                iconStyle: IconStyle(
                  iconsColor: Colors.white,
                  withBackground: true,
                  backgroundColor: Colors.orange,
                ),
                title: 'Dark mode',
                subtitle: "Automatic",
                trailing: Switch.adaptive(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.info_rounded,
                iconStyle: IconStyle(
                  backgroundColor: Colors.orange,
                ),
                title: 'About',
                subtitle: "Learn more about Combos TV",
              ),
            ],
          ),
          // You can add a settings title
          SettingsGroup(
            settingsGroupTitle: "Account",
            items: [
              SettingsItem(
                onTap: () {},
                icons: Icons.exit_to_app_rounded,
                title: "Sign Out",
              ),
            ],
          ),
          SettingsGroup(
            items: [],
          )
        ],
      ),
    );
  }
}
