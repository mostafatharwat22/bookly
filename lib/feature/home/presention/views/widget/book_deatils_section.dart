import 'package:flutter/material.dart';
import '../../../../../core/utilles/styles.dart';
import '../../../domin/entities/book_entity.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel,});
  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context)
        .size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child:  CustomBookImage(
              image:bookModel.image??"",
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.title,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.authorName?[0]?? "No authors",
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
           BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
             rating: bookModel.rating ?? 1,
             ratingsCount: bookModel.ratingsCount ?? 10,
        ),
        const SizedBox(
          height: 37,
        ),
         BooksAction(bookModel: bookModel),
      ],
    );
  }
}
