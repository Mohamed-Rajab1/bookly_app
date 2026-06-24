import 'package:bokly_app/core/utils/styles.dart';
import 'package:bokly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bokly_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: const [
          CustomSearchTextField(),
          SizedBox(height: 16),
          Text('Search Result', style: Styles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: const BookListViewItem(),
      ),
    );
  }
}
