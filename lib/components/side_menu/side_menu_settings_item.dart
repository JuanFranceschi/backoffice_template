import 'package:flutter/material.dart';

class SideMenuSettingsItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Function()? onHover, onTap;
  const SideMenuSettingsItem(
      {super.key, this.onHover, this.onTap, this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      clipBehavior: Clip.antiAlias,
      onHover: (value) {
        if (value && onHover != null) onHover!();
      },
      onPressed: onTap ?? () {},
      style: TextButton.styleFrom(fixedSize: const Size(double.infinity, 40)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          Text(
            text,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
