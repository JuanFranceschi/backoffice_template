import 'package:backoffice/components/side_menu/side_menu.dart';
import 'package:backoffice/components/side_menu/side_menu_settings_setup.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  final Widget page;
  final String activeMenu;

  const AdminPage({super.key, required this.page, required this.activeMenu});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AdminSideMenu(
                  activeMenu: widget.activeMenu,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: widget.page,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Positioned.fill(
            child: SideMenuSettingsSetup(),
          ),
        ],
      ),
    );
  }
}
