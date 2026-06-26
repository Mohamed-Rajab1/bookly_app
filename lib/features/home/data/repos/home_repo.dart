import 'package:bokly_app/core/errors/failures.dart';
import 'package:bokly_app/features/home/data/models/book_models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
