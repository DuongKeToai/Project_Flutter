
import 'package:flutter_learning/core/common/domain/entities/image_configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_config_info_model_ver_2.g.dart';

@JsonSerializable()
class ImageConfigInfoModelVer2 extends ImageConfigInfo {
  @JsonKey(name: "base_url")
  @override
  final String baseUrl;
  @JsonKey(name: "poster_sizes")
  @override
  final List<String> posterSizes;
  ImageConfigInfoModelVer2({required this.baseUrl, required this.posterSizes})
      : super(
          baseUrl: baseUrl,
          posterSizes: posterSizes,
        );

  factory ImageConfigInfoModelVer2.fromJson(Map<String, dynamic> json) =>
      _$ImageConfigInfoModelVer2FromJson(json);
}
