import '../../../domin/entities/book_entity.dart';
import 'AccessInfo.dart';
import 'SaleInfo.dart';
import 'SearchInfo.dart';
import 'VolumeInfo.dart';


class BookModel extends BookEntity {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  }) : super(
      bookId: id!,
      image: volumeInfo?.imageLinks?.thumbnail ?? '',
      authorName: volumeInfo?.authors?.first ?? 'No Name',
      price: 0.0,
      rating: volumeInfo!.averageRating,
      ratingsCount:volumeInfo.ratingsCount,
      title: volumeInfo.title!,
      previewLink: volumeInfo.previewLink,
  );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    kind: json['kind'] as String?,
    id: json['id'] as String?,
    etag: json['etag'] as String?,
    selfLink: json['selfLink'] as String?,
    volumeInfo: json['volumeInfo'] == null
        ? null
        : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    saleInfo: json['saleInfo'] == null
        ? null
        : SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
    accessInfo: json['accessInfo'] == null
        ? null
        : AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
    searchInfo: json['searchInfo'] == null
        ? null
        : SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'id': id,
    'etag': etag,
    'selfLink': selfLink,
    'volumeInfo': volumeInfo?.toJson(),
    'saleInfo': saleInfo?.toJson(),
    'accessInfo': accessInfo?.toJson(),
    'searchInfo': searchInfo?.toJson(),
  };
}
