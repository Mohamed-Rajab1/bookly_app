import 'package:bokly_app/core/utils/api_service.dart';
import 'package:bokly_app/features/home/data/models/book_models/book_model.dart';
import 'package:bokly_app/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
      endpoint:
          'volumes?Filtering=free-ebooks&q=subject:Programming&key=AIzaSyB4YHzDhf5bZWNsTo2b9otefhVdFXK-l10',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(
      endpoint:
          'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science&key=AIzaSyB4YHzDhf5bZWNsTo2b9otefhVdFXK-l10',
    );
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}
