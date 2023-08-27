
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../domin/entities/book_entity.dart';
import '../../domin/repos/home_repo.dart';
import '../data_source/home_local_data_source.dart';
import '../data_source/home_remote_data_source.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl({required this.homeLocalDataSource,required this.homeRemoteDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0})async {
    try {
      var booksList =  homeLocalDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );
      if(booksList.isNotEmpty){
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );
      return right(books);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({int pageNumber = 0})async {
    try {
      var booksList =  homeLocalDataSource.fetchNewestBooks(
        pageNumber: pageNumber,
      );
      if(booksList.isNotEmpty){
        return right(booksList);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks(
        pageNumber: pageNumber,
      );
      return right(books);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}