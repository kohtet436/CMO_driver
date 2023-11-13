import 'package:flutter/material.dart';

import '../values/color_manager.dart';
import '../values/strings_manager.dart';
import 'custom_text_widgets.dart';

class AppNavigationDrawer extends StatefulWidget {
  const AppNavigationDrawer({Key? key}) : super(key: key);

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: ColorManager.primaryColor),
            child: const CustomText(
              text: AppStrings.appName,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => _setIndex(0),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Detail'),
            onTap: () => _setIndex(1),
          ),
          ListTile(
            leading: const Icon(Icons.route),
            title: const Text('Base Route'),
            onTap: () => _setIndex(2),
          )
        ],
      ),
    );
  }

  void _setIndex(int index) {
    this.index = index;
  }
}
