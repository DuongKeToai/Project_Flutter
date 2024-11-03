
import 'package:flutter_learning/core/common/domain/entities/image_configuration.dart';

class ImageConfigInfoModel extends ImageConfigInfo {
  @override
  final String baseUrl;
  @override
  final List<String> posterSizes;
  ImageConfigInfoModel({required this.baseUrl, required this.posterSizes})
      : super(
          baseUrl: baseUrl,
          posterSizes: posterSizes,
        );

  factory ImageConfigInfoModel.fromJson(Map<String, dynamic> json) =>
      ImageConfigInfoModel(
        baseUrl: json['base_url'] as String,
        posterSizes: (json['poster_sizes'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
      );
}
