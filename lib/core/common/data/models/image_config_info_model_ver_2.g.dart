// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_config_info_model_ver_2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageConfigInfoModelVer2 _$ImageConfigInfoModelVer2FromJson(
        Map<String, dynamic> json) =>
    ImageConfigInfoModelVer2(
      baseUrl: json['base_url'] as String,
      posterSizes: (json['poster_sizes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ImageConfigInfoModelVer2ToJson(
        ImageConfigInfoModelVer2 instance) =>
    <String, dynamic>{
      'base_url': instance.baseUrl,
      'poster_sizes': instance.posterSizes,
    };
