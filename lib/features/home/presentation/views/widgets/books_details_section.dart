import 'package:bokly_app/core/utils/styles.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: const CustomBookImage(
            imageUrl: 'assets/images/success_book.png',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          'The Jungle Book',
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: 0,
          count: 0,
        ),
        const SizedBox(height: 37),
        const BooksAction(),
      ],
    );
  }
}
