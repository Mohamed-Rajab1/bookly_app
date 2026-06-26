import 'package:bokly_app/core/errors/failures.dart';
import 'package:bokly_app/core/utils/api_service.dart';
import 'package:bokly_app/features/home/data/models/book_models/book_model.dart';
import 'package:bokly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?filter=free-ebooks&sorting=newest&q=subject:programming&key=AIzaSyB4YHzDhf5bZWNsTo2b9otefhVdFXK-l10',
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
