import 'package:backoffice/components/side_menu/side_menu_settings_item.dart';
import 'package:backoffice/components/side_menu/side_menu_settings_menu.dart';
import 'package:backoffice/main.dart';
import 'package:backoffice/utils/side_menu_manager.dart';
import 'package:backoffice/utils/theme_manager.dart';
import 'package:backoffice/utils/toast_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenuSettingsSetup extends StatelessWidget {
  const SideMenuSettingsSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SideMenuManager>(
      builder: (context, menuManager, child) {
        if (menuManager.settings) {
          return InkWell(
            onTap: () => Provider.of<SideMenuManager>(context, listen: false)
                .onTapSettings(),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            mouseCursor: MouseCursor.defer,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 60,
                        bottom: 20,
                      ),
                      child: SideMenuSettingsMenu(
                        items: [
                          SideMenuSettingsItem(
                            text: 'Show Toast',
                            icon: CupertinoIcons.info_circle,
                            onHover: () => Provider.of<SideMenuManager>(
                              context,
                              listen: false,
                            ).onAddSecondaryMenu(
                              Menus(
                                1,
                                SideMenuSettingsMenu(items: [
                                  SideMenuSettingsItem(
                                    icon: CupertinoIcons.check_mark,
                                    text: 'Success',
                                    onTap: () => toastManager.showToast(
                                        context, 'Success',
                                        type: ToastType.success),
                                  ),
                                  SideMenuSettingsItem(
                                    icon: CupertinoIcons.xmark,
                                    text: 'Error',
                                    onTap: () => toastManager.showToast(
                                        context, 'Error',
                                        type: ToastType.error),
                                  ),
                                  SideMenuSettingsItem(
                                    icon:
                                        CupertinoIcons.exclamationmark_triangle,
                                    text: 'Warning',
                                    onTap: () => toastManager.showToast(
                                        context, 'Warning',
                                        type: ToastType.warning),
                                  ),
                                  SideMenuSettingsItem(
                                    icon: CupertinoIcons.info,
                                    text: 'Info',
                                    onTap: () => toastManager.showToast(
                                        context, 'Info',
                                        type: ToastType.info),
                                  ),
                                  SideMenuSettingsItem(
                                    icon: CupertinoIcons.circle,
                                    text: 'Simple',
                                    onTap: () => toastManager.showToast(
                                        context, 'Simple',
                                        type: ToastType.simple),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                          SideMenuSettingsItem(
                            text: 'Tema',
                            icon: CupertinoIcons.paintbrush,
                            onHover: () => Provider.of<SideMenuManager>(
                              context,
                              listen: false,
                            ).onAddSecondaryMenu(
                              Menus(
                                0,
                                SideMenuSettingsMenu(items: [
                                  SideMenuSettingsItem(
                                    icon: CupertinoIcons.moon_stars,
                                    text: 'Escuro',
                                    onTap: () => Provider.of<ThemeManager>(
                                            context,
                                            listen: false)
                                        .toggleTheme(ThemeMode.dark),
                                  ),
                                  SideMenuSettingsItem(
                                    icon: CupertinoIcons.sun_max,
                                    text: 'Claro',
                                    onTap: () => Provider.of<ThemeManager>(
                                            context,
                                            listen: false)
                                        .toggleTheme(ThemeMode.light),
                                  ),
                                  SideMenuSettingsItem(
                                    icon: CupertinoIcons.settings,
                                    text: 'Padrão do Sistema',
                                    onTap: () => Provider.of<ThemeManager>(
                                            context,
                                            listen: false)
                                        .toggleTheme(ThemeMode.system),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (menuManager.secondaryMenu != null)
                      Padding(
                        padding: EdgeInsets.only(
                          bottom:
                              20 + (menuManager.secondaryMenu!.position * 40),
                          left: 5,
                        ),
                        child: menuManager.secondaryMenu!.menu,
                      )
                  ],
                ),
              ),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
