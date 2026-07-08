import 'package:bokly_app/core/errors/failures.dart';
import 'package:bokly_app/features/home/data/models/book_models/book_model.dart';
import 'package:bokly_app/features/home/data/repos/home_repo.dart';
import 'package:bokly_app/features/home/domain/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookModel>, NoParam> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);
  Future<Either<Failure, List<BookModel>>> call([NoParam? params]) async {
    return await homeRepo.fetchFeaturedBooks();
  }
}
