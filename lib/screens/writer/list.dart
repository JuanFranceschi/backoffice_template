import 'package:backoffice/components/ui_components/background_card.dart';
import 'package:backoffice/components/ui_components/input_field.dart';
import 'package:backoffice/components/ui_components/rrect_button.dart';
import 'package:backoffice/components/ui_components/table.dart';
import 'package:backoffice/components/ui_components/yes_no_dialog.dart';
import 'package:backoffice/components/writer/insert_dialog.dart';
import 'package:backoffice/data/writer_service.dart';
import 'package:backoffice/models/writer.dart';
import 'package:backoffice/utils/debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class WriterList extends StatefulWidget {
  const WriterList({super.key});

  @override
  State<WriterList> createState() => _WriterListState();
}

class _WriterListState extends State<WriterList> {
  bool _fetching = true;
  List<Writer> writers = List.from([]);
  final _debounce = Debouncer(milliseconds: 600);

  @override
  void initState() {
    super.initState();

    fetchWriters();
  }

  fetchWriters({String? searchTerm}) async {
    setState(() => _fetching = true);

    writers.clear();
    writers.addAll(await WriterService.getAllWriters(searchTerm: searchTerm));

    setState(() => _fetching = false);
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundCard(
      title: 'Writers',
      suffixWidgets: [
        CustomRRectButton(
          text: 'Insert',
          onClick: () => showDialog(
            context: context,
            builder: (context) => const InsertWriter(),
          ).then(
            (value) => fetchWriters(),
          ),
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputField(
            title: 'Pesquisar:',
            placeholder: '...',
            onChanged: (value) => _debounce.run(
              () => fetchWriters(searchTerm: value),
            ),
          ),
          const SizedBox(height: 20),
          CustomTable(expand: false, fetching: _fetching, columns: const [
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Actions'),
            ),
          ], rows: [
            for (var book in writers)
              DataRow(
                cells: [
                  DataCell(
                    SizedBox(width: 200, child: Text(book.name)),
                  ),
                  DataCell(
                    SizedBox(
                      width: 50,
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomYesNoDialog(
                              title: "Delete '${book.name}' ?",
                              message:
                                  "All Books of the Writers willl be deleted as well!",
                              yesFunction: () async {
                                context.loaderOverlay.show();
                                await WriterService.deleteWriter(book.id);
                                context.loaderOverlay.hide();
                                if (mounted) Navigator.pop(context);
                                fetchWriters();
                              },
                              noFunction: () => Navigator.pop(context),
                            ),
                          );
                        },
                        icon: const Icon(CupertinoIcons.delete),
                      ),
                    ),
                  ),
                ],
              ),
          ]),
        ],
      ),
    );
  }
}
