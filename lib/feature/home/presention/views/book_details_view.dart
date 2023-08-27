import 'package:bookly_app/feature/home/domin/entities/book_entity.dart';
import 'package:bookly_app/feature/home/presention/views/widget/book_details_view_body.dart';
import 'package:flutter/material.dart';


class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel,});
  final BookEntity bookModel;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(bookModel:bookModel,),
      ),
    );
  }
}
