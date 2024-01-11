import 'package:flutter/material.dart';

class CustomBackgroundCard extends StatelessWidget {
  final Widget child;
  final String title;
  final String? subTitle;
  final List<Widget> suffixWidgets;

  const CustomBackgroundCard({
    super.key,
    required this.child,
    required this.title,
    this.subTitle,
    this.suffixWidgets = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            offset: Offset.fromDirection(1),
            blurRadius: 5,
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  if (subTitle != null) ...[
                    Text(
                      subTitle!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ],
              ),
              if (suffixWidgets.isNotEmpty) ...[
                const Spacer(),
                ...suffixWidgets
              ]
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}
