import 'package:hive_flutter/adapters.dart';
import '../../../../constents.dart';
import '../../domin/entities/book_entity.dart';


abstract class HomeLocalDataSource{
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks({int pageNumber = 0});
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10 ;
    int endIndex = (pageNumber +1 ) *10;
    var box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if(startIndex >=length|| endIndex > length){
      return [];
    }
    return box.values.toList().sublist(startIndex,endIndex );
  }

  @override
  List<BookEntity> fetchNewestBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10 ;
    int endIndex = (pageNumber +1 ) *10;
    var boox = Hive.box<BookEntity>(kNewestBox);
    int length = boox.values.length;
    if(startIndex>= length ||endIndex > length ){
      return [];
    }
    return boox.values.toList().sublist(startIndex,endIndex );
  }
}