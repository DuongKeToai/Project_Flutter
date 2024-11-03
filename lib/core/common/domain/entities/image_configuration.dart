import 'package:collection/collection.dart';

class ImageConfigInfo {
  final String baseUrl;
  final List<String> posterSizes;
  ImageConfigInfo({
    required this.baseUrl,
    required this.posterSizes,
  });

  String getPosterSizeText(String name) {
    final value = posterSizes.firstWhereOrNull((value) => value == name);
    if (value != null) {
      return value;
    }
    return 'original';
  }
}
