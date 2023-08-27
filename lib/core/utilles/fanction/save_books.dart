import 'package:hive/hive.dart';

import '../../../feature/home/domin/entities/book_entity.dart';

void saveBooksDate(List<BookEntity> books, String boxName){
  var bok=  Hive.box<BookEntity>(boxName);
  bok.addAll(books);
}
