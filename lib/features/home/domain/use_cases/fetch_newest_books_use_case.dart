import 'package:bokly_app/core/errors/failures.dart';
import 'package:bokly_app/core/use_cases/use_case.dart';
import 'package:bokly_app/features/home/domain/repos/home_repo.dart';
import 'package:bokly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase extends UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;
  FetchNewestBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? params]) async {
    return await homeRepo.fetchNewestBooks();
  }
}
