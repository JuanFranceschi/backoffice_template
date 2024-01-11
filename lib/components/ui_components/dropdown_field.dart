import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String title;
  final List<DropdownMenuItem<dynamic>> items;
  final Function(dynamic)? onChanged;
  final String? placeholder;
  final dynamic value;

  const CustomDropdownField({
    super.key,
    required this.title,
    this.onChanged,
    required this.items,
    this.placeholder,
    this.value,
  });

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
          DropdownButtonFormField(
            value: value,
            items: items,
            onChanged: onChanged,
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
