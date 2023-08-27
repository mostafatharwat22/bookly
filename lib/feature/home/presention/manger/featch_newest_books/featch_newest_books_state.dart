part of 'featch_newest_books_cubit.dart';

@immutable
abstract class FetchNewestBooksState {}

class FetchNewestBooksInitial extends FetchNewestBooksState {}

class FetchNewestBooksLoading extends FetchNewestBooksState {}
class FetchNewestBooksPaginationLoading extends FetchNewestBooksState {}
class FetchNewestBooksPaginationFailure extends FetchNewestBooksState {
  final String errorMassage;
  FetchNewestBooksPaginationFailure(this.errorMassage);
}

class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errorMassage;

  FetchNewestBooksFailure(this.errorMassage);
}

class FetchNewestBooksSuccessful extends FetchNewestBooksState {
  final List<BookEntity> books;
  FetchNewestBooksSuccessful(this.books);
}
