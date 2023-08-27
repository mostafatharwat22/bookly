import 'package:bookly_app/feature/home/presention/views/widget/similar_books_listview_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utilles/styles.dart';


class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
         const SimilarBooksListviewBloc(),
      ],
    );
  }
}
