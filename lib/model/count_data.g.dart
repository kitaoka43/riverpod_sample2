// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CountData _$$_CountDataFromJson(Map<String, dynamic> json) => _$_CountData(
      count: json['count'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_CountDataToJson(_$_CountData instance) =>
    <String, dynamic>{
      'count': instance.count,
      'createdAt': instance.createdAt.toIso8601String(),
    };
