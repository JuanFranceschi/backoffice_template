import 'package:flutter/material.dart';

class SideMenuItem extends StatefulWidget {
  final IconData icon, activeIcon;
  final String tip;
  final Function() onTap;
  final bool active;
  const SideMenuItem({
    super.key,
    required this.icon,
    required this.tip,
    required this.active,
    required this.activeIcon,
    required this.onTap,
  });

  @override
  State<SideMenuItem> createState() => _SideMenuItemState();
}

class _SideMenuItemState extends State<SideMenuItem> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    late Color background, borderColor;

    if (_hover || widget.active) {
      background = Theme.of(context).colorScheme.primaryContainer;
      borderColor = Theme.of(context).colorScheme.secondary;
    } else {
      background = Theme.of(context).backgroundColor;
      borderColor = Theme.of(context).backgroundColor;
    }

    return SizedBox(
      height: 50,
      width: 50,
      child: Center(
        child: Tooltip(
          message: widget.tip,
          child: InkWell(
            onHover: (value) => setState(() => _hover = value),
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: background,
                border: Border.all(
                  color: borderColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  widget.active ? widget.activeIcon : widget.icon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
