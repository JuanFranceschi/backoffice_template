import 'package:backoffice/components/side_menu/side_menu_item.dart';
import 'package:backoffice/utils/app_routes.dart';
import 'package:backoffice/utils/side_menu_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminSideMenu extends StatelessWidget {
  final String activeMenu;

  const AdminSideMenu({super.key, required this.activeMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Theme.of(context).backgroundColor, boxShadow: [
        BoxShadow(
          color: Theme.of(context).shadowColor,
          offset: Offset.fromDirection(1),
          blurRadius: 5,
        )
      ]),
      width: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            SideMenuItem(
              key: const Key('creator'),
              icon: CupertinoIcons.book,
              activeIcon: CupertinoIcons.book_fill,
              tip: 'Books',
              active: activeMenu == 'creator',
              onTap: () => Navigator.pushNamed(context, AppRoutes.bookList),
            ),
            SideMenuItem(
              key: const Key('writer'),
              icon: CupertinoIcons.person_2,
              activeIcon: CupertinoIcons.person_2_fill,
              tip: 'Writers',
              active: activeMenu == 'writer',
              onTap: () => Navigator.pushNamed(context, AppRoutes.writerList),
            ),
            const Spacer(),
            SideMenuItem(
              key: const Key('config'),
              icon: CupertinoIcons.settings,
              activeIcon: CupertinoIcons.settings,
              tip: 'Configurações',
              active: activeMenu == 'config',
              onTap: () {
                Provider.of<SideMenuManager>(context, listen: false)
                    .onTapSettings();
              },
            ),
          ],
        ),
      ),
    );
  }
}
