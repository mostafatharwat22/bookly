import 'package:bloc/bloc.dart';
import 'package:bookly_app/feature/home/domin/entities/book_entity.dart';
import 'package:flutter/cupertino.dart';
import '../../../domin/use_cases/fetch_newest_books_use_case.dart';
part 'featch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.fetchNewestBooksUseCase)
      : super(FetchNewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
    if (pageNumber ==0) {
      print(pageNumber);
      emit(FetchNewestBooksLoading());
    }else {
      emit(FetchNewestBooksPaginationLoading());
      print(pageNumber);
    }
    var route = await fetchNewestBooksUseCase.call(pageNumber);
    route.fold((failure) {
      if (state is FetchNewestBooksFailure) {
        emit(FetchNewestBooksFailure(failure.message));
      }else{
        emit(FetchNewestBooksPaginationFailure(failure.message));
      }
    }, (books) {
      print(pageNumber);
      emit(FetchNewestBooksSuccessful(books));
      print(pageNumber);
    });
  }
}
