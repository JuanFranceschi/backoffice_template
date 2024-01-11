import 'package:backoffice/components/ui_components/background_card.dart';
import 'package:backoffice/components/ui_components/input_field.dart';
import 'package:backoffice/components/ui_components/rrect_button.dart';
import 'package:backoffice/components/ui_components/table.dart';
import 'package:backoffice/components/ui_components/yes_no_dialog.dart';
import 'package:backoffice/data/book_service.dart';
import 'package:backoffice/models/book.dart';
import 'package:backoffice/utils/app_routes.dart';
import 'package:backoffice/utils/debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CreatorList extends StatefulWidget {
  const CreatorList({super.key});

  @override
  State<CreatorList> createState() => _CreatorListState();
}

class _CreatorListState extends State<CreatorList> {
  bool _fetching = true;
  List<Book> books = List.from([]);
  final _debounce = Debouncer(milliseconds: 600);

  @override
  void initState() {
    super.initState();

    fetchBooks();
  }

  fetchBooks({String? searchTerm}) async {
    setState(() => _fetching = true);

    books.clear();
    books.addAll(await BookService.getAllBooks(searchTerm: searchTerm));

    setState(() => _fetching = false);
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundCard(
      title: 'Livros',
      suffixWidgets: [
        CustomRRectButton(
          text: 'Insert',
          onClick: () => Navigator.pushNamed(
            context,
            AppRoutes.bookInsert,
          ).then((value) => fetchBooks()),
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
              () => fetchBooks(searchTerm: value),
            ),
          ),
          const SizedBox(height: 20),
          CustomTable(expand: false, fetching: _fetching, columns: const [
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Writer'),
            ),
            DataColumn(
              label: Text('Actions'),
            ),
          ], rows: [
            for (var book in books)
              DataRow(
                cells: [
                  DataCell(
                    SizedBox(width: 200, child: Text(book.name)),
                  ),
                  DataCell(
                    SizedBox(width: 200, child: Text(book.writer.name)),
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
                              message: "This action can not be reversed",
                              yesFunction: () async {
                                context.loaderOverlay.show();
                                await BookService.deleteBook(book.id);
                                context.loaderOverlay.hide();
                                if (mounted) Navigator.pop(context);
                                fetchBooks();
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
