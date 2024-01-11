import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String title, placeholder;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomInputField(
      {super.key,
      required this.title,
      required this.placeholder,
      this.onChanged,
      this.controller});

  @override
  Widget build(BuildContext context) {
    InputBorder inactiveBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Theme.of(context).hintColor,
      ),
      gapPadding: 0,
    );

    InputBorder activeBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(
        color: Theme.of(context).focusColor,
      ),
      gapPadding: 0,
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
            decoration: InputDecoration(
              border: inactiveBorder,
              focusedBorder: activeBorder,
              enabledBorder: inactiveBorder,
              hintText: placeholder,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
