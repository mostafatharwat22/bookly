import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../domin/entities/book_entity.dart';
import '../../../domin/use_cases/fetch_featured_books_use_case.dart';
part 'featch_feature_books_state.dart';

class FetchFeatureBooksCubit extends Cubit<FetchFeatureBooksState> {
  FetchFeatureBooksCubit(this.featuredBooksUseCase)
      : super(FetchFeatureBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeatureBooks({int pageNumber = 0}) async {
    if (pageNumber ==0) {
      emit(FetchFeatureBooksLoading());
    }else {
      emit(FetchFeatureBooksPaginationLoading());
    }
    var route =
    await featuredBooksUseCase.call(pageNumber);
    route.fold((failure) {
      if (state is FetchFeatureBooksFailure) {
        emit(FetchFeatureBooksFailure(failure.message));
      }else{
        emit(FetchFeatureBooksPaginationFailure(failure.message));
      }
    }, (books) {
      emit(FetchFeatureBooksSuccessful(books));
    });
  }
}
