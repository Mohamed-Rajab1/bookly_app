import 'package:bloc/bloc.dart';
import 'package:bokly_app/features/home/data/models/book_models/book_model.dart';
import 'package:equatable/equatable.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit() : super(NewestBooksInitial());
}
