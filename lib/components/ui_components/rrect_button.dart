import 'package:flutter/material.dart';

class CustomRRectButton extends StatelessWidget {
  final Function() onClick;
  final String text;
  final double height, width;
  final bool transparent;

  const CustomRRectButton({
    super.key,
    required this.text,
    required this.onClick,
    this.height = 40,
    this.width = 100,
  }) : transparent = false;

  const CustomRRectButton.transparent({
    super.key,
    required this.text,
    required this.onClick,
    this.height = 40,
    this.width = 100,
  }) : transparent = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: transparent ? Colors.transparent : null,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: transparent
              ? BorderSide(color: Theme.of(context).focusColor)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        fixedSize: Size(width, height),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: transparent
                ? TextStyle(color: Theme.of(context).focusColor)
                : null,
          )
        ],
      ),
    );
  }
}
