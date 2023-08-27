import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domin/entities/book_entity.dart';
import '../../manger/featch_newest_books/featch_newest_books_cubit.dart';
import 'best_seller_list_view.dart';

class BestSellerListViewBlocBuilder extends StatefulWidget {
  const BestSellerListViewBlocBuilder({Key? key,}) : super(key: key);

  @override
  State<BestSellerListViewBlocBuilder> createState() => _BestSellerListViewBlocBuilderState();
}

class _BestSellerListViewBlocBuilderState extends State<BestSellerListViewBlocBuilder> {
  List <BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksState>(
      listener: (context, state) {
        if (state is FetchNewestBooksSuccessful){
          return books.addAll(state.books);
        }
        if(state is FetchNewestBooksPaginationFailure){
          ScaffoldMessenger.of(context).
          showSnackBar(const SnackBar(content: Text('Failure message')));
        }
      },
      builder: (context, state) {
        if(state is FetchNewestBooksSuccessful ||
            state is  FetchNewestBooksPaginationLoading ||
            state is FetchNewestBooksPaginationFailure
        ){
          return BestSellerListView(
            books: books,
          );
        }else if(state is FetchNewestBooksFailure){
          return Text(state.errorMassage);
        }else{
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
