import 'package:backoffice/components/ui_components/input_field.dart';
import 'package:backoffice/components/ui_components/rrect_button.dart';
import 'package:backoffice/data/writer_service.dart';
import 'package:backoffice/models/writer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class InsertWriter extends StatefulWidget {
  const InsertWriter({
    super.key,
  });

  @override
  State<InsertWriter> createState() => _InsertWriterState();
}

class _InsertWriterState extends State<InsertWriter> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

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
                      'Insert Writer',
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
              Wrap(
                children: [
                  CustomInputField(
                    title: 'Name',
                    placeholder: 'Name',
                    controller: _nameController,
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomRRectButton(
                    text: 'Save',
                    onClick: () async {
                      context.loaderOverlay.show();
                      await WriterService.insertWriter(
                          Writer('0', _nameController.text));
                      context.loaderOverlay.hide();
                      if (mounted) Navigator.pop(context);
                    },
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
