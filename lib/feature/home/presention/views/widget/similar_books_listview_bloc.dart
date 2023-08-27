import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manger/featch_feature_books/featch_feature_books_cubit.dart';
import 'featured_list_view.dart';

class SimilarBooksListviewBloc extends StatelessWidget {
  const SimilarBooksListviewBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeatureBooksCubit, FetchFeatureBooksState>(
      builder: (context, state) {
        if(state is FetchFeatureBooksSuccessful){
          return  FeaturedBooksListView(books: state.books,);
        }else if(state is FetchFeatureBooksFailure){
          return Text(state.errorMassage);
        }else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
