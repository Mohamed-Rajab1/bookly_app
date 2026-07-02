import 'package:bokly_app/core/errors/failures.dart';
import 'package:bokly_app/core/utils/api_service.dart';
import 'package:bokly_app/features/home/data/models/book_models/book_model.dart';
import 'package:bokly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science&key=AIzaSyB4YHzDhf5bZWNsTo2b9otefhVdFXK-l10',
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&q=subject:Programming&key=AIzaSyB4YHzDhf5bZWNsTo2b9otefhVdFXK-l10',
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endpoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category&key=AIzaSyB4YHzDhf5bZWNsTo2b9otefhVdFXK-l10',
      );
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
