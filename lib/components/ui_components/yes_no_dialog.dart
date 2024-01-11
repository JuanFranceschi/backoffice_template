import 'package:backoffice/components/ui_components/rrect_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomYesNoDialog extends StatelessWidget {
  final String title, message;
  final Function() yesFunction, noFunction;
  final String? noButtonText, yesButtonText;
  const CustomYesNoDialog(
      {super.key,
      required this.message,
      required this.yesFunction,
      required this.noFunction,
      required this.title,
      this.noButtonText,
      this.yesButtonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Theme.of(context).backgroundColor,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700, maxHeight: 275),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(CupertinoIcons.xmark),
                  ),
                ],
              ),
              const Divider(),
              Text(
                message,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary.withAlpha(175),
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomRRectButton.transparent(
                    text: 'No',
                    onClick: noFunction,
                  ),
                  const SizedBox(width: 20),
                  CustomRRectButton(
                    text: 'Yes',
                    onClick: yesFunction,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
