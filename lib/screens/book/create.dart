import 'package:backoffice/components/ui_components/background_card.dart';
import 'package:backoffice/components/ui_components/dropdown_field.dart';
import 'package:backoffice/components/ui_components/input_field.dart';
import 'package:backoffice/components/ui_components/rrect_button.dart';
import 'package:backoffice/data/book_service.dart';
import 'package:backoffice/data/writer_service.dart';
import 'package:backoffice/main.dart';
import 'package:backoffice/models/book.dart';
import 'package:backoffice/models/writer.dart';
import 'package:backoffice/utils/toast_manager.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CreatorCreateBook extends StatefulWidget {
  const CreatorCreateBook({super.key});

  @override
  State<CreatorCreateBook> createState() => _CreatorCreateBookState();
}

class _CreatorCreateBookState extends State<CreatorCreateBook> {
  final List<Writer> _writers = List.from([]);
  Writer? _selectedWriter;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _getWriters();
  }

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
  }

  _getWriters() async {
    var data = await WriterService.getAllWriters();

    setState(() => _writers.addAll(data));
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundCard(
      title: 'Insert Book',
      subTitle:
          "The book you insert will disappear on reloading, since this demo uses a cached database",
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CustomInputField(
                title: "Name",
                placeholder: 'Name',
                controller: _nameController,
              ),
              CustomDropdownField(
                placeholder: 'Select Writer',
                value: _selectedWriter,
                title: 'Writer',
                items: _writers
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.name,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ))
                    .toList(),
                onChanged: (newWriter) {
                  setState(() => _selectedWriter = newWriter);
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              CustomRRectButton(
                text: 'Save',
                onClick: () async {
                  if (_nameController.text.isEmpty || _selectedWriter == null) {
                    toastManager.showToast(
                      context,
                      'There is information missing!',
                      type: ToastType.error,
                    );

                    return;
                  }
                  context.loaderOverlay.show();
                  await BookService.insertBook(
                      Book('', _nameController.text, _selectedWriter!));
                  context.loaderOverlay.hide();
                  if (mounted) {
                    toastManager.showToast(
                      context,
                      'Book Inserted!',
                      type: ToastType.success,
                    );

                    Navigator.pop(context);
                  }
                },
              ),
              CustomRRectButton.transparent(
                text: 'Cancel',
                onClick: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
