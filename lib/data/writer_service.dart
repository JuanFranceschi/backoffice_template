import 'package:backoffice/main.dart';
import 'package:backoffice/models/writer.dart';

class WriterService {
  static Future<List<Writer>> getAllWriters({String? searchTerm}) async {
    await Future.delayed(const Duration(seconds: 1));

    List<Writer> writers = List.from(database.writers);
    if (searchTerm == null) {
      return writers;
    } else {
      return writers
          .where((element) => element.name.contains(searchTerm))
          .toList();
    }
  }

  static Future insertWriter(Writer writer) async {
    await Future.delayed(const Duration(seconds: 1));

    database.writers
        .add(Writer(database.writers.length.toString(), writer.name));

    return;
  }

  static Future deleteWriter(String id) async {
    await Future.delayed(const Duration(seconds: 1));

    database.writers.removeWhere((x) => x.id == id);
    database.books.removeWhere((y) => y.writer.id == id);

    return;
  }
}
