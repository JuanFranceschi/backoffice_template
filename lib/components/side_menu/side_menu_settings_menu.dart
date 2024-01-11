import 'package:flutter/material.dart';

class SideMenuSettingsMenu extends StatelessWidget {
  final List<Widget> items;
  const SideMenuSettingsMenu({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 5,
          ),
        ],
        color: Theme.of(context).backgroundColor,
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: items,
      ),
    );
  }
}
