import 'package:bokly_app/core/errors/failures.dart';
import 'package:bokly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bokly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bokly_app/features/home/domain/repos/home_repo.dart';
import 'package:bokly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  // @override
  // Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
  //   required String category,
  // }) async {
  //   try {
  //     var data = await apiService.get(
  //       endpoint:
  //           'volumes?Filtering=free-ebooks&Sorting=relevance&q=$category&key=AIzaSyB4YHzDhf5bZWNsTo2b9otefhVdFXK-l10',
  //     );
  //     List<BookModel> books = [];

  //     for (var item in data['items']) {
  //       books.add(BookModel.fromJson(item));
  //     }
  //     return right(books);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }
}
