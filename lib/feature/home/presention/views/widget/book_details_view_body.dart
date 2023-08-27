import 'package:bookly_app/feature/home/presention/views/widget/similar_books_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../domin/entities/book_entity.dart';
import 'book_deatils_section.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel,});
  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children:[
                 const CustomBookDetailsAppBar(),
                BookDetailsSection(bookModel: bookModel,),
                 const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                   const SimilarBooksSection(),
                 const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
