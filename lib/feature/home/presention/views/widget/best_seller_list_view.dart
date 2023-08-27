import 'package:bookly_app/feature/home/domin/entities/book_entity.dart';
import 'package:bookly_app/feature/home/presention/manger/featch_newest_books/featch_newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view_items.dart';


class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key, required this.books,});
  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  final ScrollController _scrollController = ScrollController();
  var nextPage = 1;
  var isLoading =false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async{
    if (_scrollController.position.pixels >=
        0.4 * _scrollController.position.maxScrollExtent) {
      if (!isLoading){
        isLoading = true;
        await BlocProvider.of<FetchNewestBooksCubit>(context).fetchNewestBooks(
          pageNumber: nextPage++,
        );
        isLoading =false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      controller: _scrollController,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return  Padding(
          padding:const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            bookEntity: widget.books[index],
          ),
        );
      },
    );
  }
}


