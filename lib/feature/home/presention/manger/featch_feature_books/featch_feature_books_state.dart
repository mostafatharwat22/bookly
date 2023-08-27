part of 'featch_feature_books_cubit.dart';

@immutable
abstract class FetchFeatureBooksState {}

class FetchFeatureBooksInitial extends FetchFeatureBooksState {}

class FetchFeatureBooksLoading extends FetchFeatureBooksState {}
class FetchFeatureBooksPaginationLoading extends FetchFeatureBooksState {}
class FetchFeatureBooksPaginationFailure extends FetchFeatureBooksState {
  final String errorMassage;
  FetchFeatureBooksPaginationFailure(this.errorMassage);
}

class FetchFeatureBooksFailure extends FetchFeatureBooksState {
  final String errorMassage;
  FetchFeatureBooksFailure(this.errorMassage);
}

class FetchFeatureBooksSuccessful extends FetchFeatureBooksState {
  final List<BookEntity> books;

  FetchFeatureBooksSuccessful(this.books);
}
