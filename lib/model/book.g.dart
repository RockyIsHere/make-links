// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
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
