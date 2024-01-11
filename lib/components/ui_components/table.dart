import 'package:flutter/material.dart';

class CustomTable extends StatefulWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final bool expand, fetching;
  const CustomTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.fetching,
    this.expand = true,
  });

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.fetching) {
      return Text(
        '... fetching data',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    if (widget.columns.isEmpty || widget.rows.isEmpty) {
      return Text(
        'No Data to be shown',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontStyle: FontStyle.italic,
        ),
      );
    }

    if (widget.expand) {
      return SizedBox(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: DataTable(
            columns: widget.columns,
            rows: widget.rows,
          ),
        ),
      );
    }

    return Scrollbar(
      thumbVisibility: true,
      controller: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: DataTable(
            columns: widget.columns,
            rows: widget.rows,
          ),
        ),
      ),
    );
  }
}
