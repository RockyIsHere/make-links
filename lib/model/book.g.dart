// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      publisher: json['publisher'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      imgUrl: json['imgUrl'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      content: json['content'] as String?,
      height: (json['height'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'publisher': instance.publisher,
      'date': instance.date?.toIso8601String(),
      'imgUrl': instance.imgUrl,
      'score': instance.score,
      'rating': instance.rating,
      'content': instance.content,
      'height': instance.height,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      rating: (json['rating'] as num?)?.toDouble(),
      review: json['review'] as String?,
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'rating': instance.rating,
      'review': instance.review,
    };
