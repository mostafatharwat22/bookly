import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domin/entities/book_entity.dart';
import '../../manger/featch_feature_books/featch_feature_books_cubit.dart';
import 'featured_list_view.dart';

class FeaturedBooksListViewBlocBuilder extends StatefulWidget {
  const FeaturedBooksListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  State<FeaturedBooksListViewBlocBuilder> createState() => _FeaturedBooksListViewBlocBuilderState();
}

class _FeaturedBooksListViewBlocBuilderState extends State<FeaturedBooksListViewBlocBuilder> {
  List <BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeatureBooksCubit, FetchFeatureBooksState>(
      listener: (context, state) {
        if (state is FetchFeatureBooksSuccessful){
          return books.addAll(state.books);
        }
        if(state is FetchFeatureBooksPaginationFailure){
          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text('Failure message')));
        }
      },

      builder: (context, state) {
        if(state is FetchFeatureBooksSuccessful ||
            state is  FetchFeatureBooksPaginationLoading ||
            state is FetchFeatureBooksPaginationFailure
        ){
          return  FeaturedBooksListView(
            books: books,
          );
        }else if(state is FetchFeatureBooksFailure){
          return Text(state.errorMassage);
        }else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}