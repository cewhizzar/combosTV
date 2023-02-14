import 'package:flutter/material.dart';

class DrawerBotton extends StatelessWidget {
  const DrawerBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.orange),
            child: Text(" Menu"),
          ),
          ListTile(
            title: const Text("Item1"),
            onTap: () => print("item 1 selected"),
          ),
          ListTile(
            title: const Text("Item2"),
            onTap: () => print("item 2 selected"),
          ),
          ListTile(
            title: const Text("Item3"),
            onTap: () => print("item 3 selected"),
          ),
          ListTile(
            title: const Text("Item4"),
            onTap: () => print("item 4 selected"),
          ),
        ],
      ),
    );
  }
}
