import 'package:bokly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBoxData(List<BookEntity> books, String boxName) {
  var box = Hive.box(boxName);
  box.add(books);
}
