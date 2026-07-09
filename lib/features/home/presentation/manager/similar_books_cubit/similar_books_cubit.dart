import 'package:bloc/bloc.dart';
import 'package:bokly_app/features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit() : super(SimilarBooksInitial());
  // SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  // //final HomeRepo homeRepo;

  // Future<void> fetchSimilarBooks({required String category}) async {
  //   emit(SimilarBooksLoading());
  //   var result = await homeRepo.fetchSimilarBooks(category: category);
  //   result.fold(
  //     (failure) {
  //       emit(SimilarBooksFailure(errMessage: failure.errMessage));
  //     },
  //     (books) {
  //       emit(SimilarBooksSuccess(books: books));
  //     },
  //   );
  // }
}
