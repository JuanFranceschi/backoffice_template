import 'package:backoffice/main.dart';
import 'package:backoffice/models/book.dart';

class BookService {
  static Future<List<Book>> getAllBooks({String? searchTerm}) async {
    await Future.delayed(const Duration(seconds: 1));

    List<Book> books = List.from(database.books);
    if (searchTerm == null) {
      return books;
    } else {
      return books
          .where((element) =>
              element.name.contains(searchTerm) ||
              element.writer.name.contains(searchTerm))
          .toList();
    }
  }

  static Future insertBook(Book book) async {
    await Future.delayed(const Duration(seconds: 1));

    database.books
        .add(Book(database.books.length.toString(), book.name, book.writer));

    return;
  }

  static Future deleteBook(String id) async {
    await Future.delayed(const Duration(seconds: 1));

    database.books.removeWhere((x) => x.id == id);

    return;
  }
}
