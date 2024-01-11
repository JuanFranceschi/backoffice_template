import 'package:backoffice/models/book.dart';
import 'package:backoffice/models/writer.dart';

class FakeDatabase {
  final List<Book> books;
  final List<Writer> writers;

  FakeDatabase()
      : writers = [
          Writer('1', 'J.R.R. Tolkien'),
          Writer('2', 'Edgar Allan Poe'),
        ],
        books = [
          Book('1', 'The Hobbit', Writer('1', 'J.R.R. Tolkien')),
          Book('2', 'The Raven', Writer('2', 'Edgar Allan Poe')),
        ];
}
