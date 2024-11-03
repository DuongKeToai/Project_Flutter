/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bg-night.png
  AssetGenImage get bgNight =>
      const AssetGenImage('assets/images/bg-night.png');

  /// File path: assets/images/bg_light.png
  AssetGenImage get bgLight =>
      const AssetGenImage('assets/images/bg_light.png');

  /// File path: assets/images/dog.png
  AssetGenImage get dog => const AssetGenImage('assets/images/dog.png');

  /// File path: assets/images/fb_ic.png
  AssetGenImage get fbIc => const AssetGenImage('assets/images/fb_ic.png');

  /// File path: assets/images/gg_ic.png
  AssetGenImage get ggIc => const AssetGenImage('assets/images/gg_ic.png');

  /// File path: assets/images/language_ic.png
  AssetGenImage get languageIc =>
      const AssetGenImage('assets/images/language_ic.png');

  /// File path: assets/images/location_ic.png
  AssetGenImage get locationIc =>
      const AssetGenImage('assets/images/location_ic.png');

  /// File path: assets/images/product_logo.png
  AssetGenImage get productLogo =>
      const AssetGenImage('assets/images/product_logo.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [bgNight, bgLight, dog, fbIc, ggIc, languageIc, locationIc, productLogo];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// Directory path: assets/svg/WiFi Signal
  $AssetsSvgWiFiSignalGen get wiFiSignal => const $AssetsSvgWiFiSignalGen();

  /// File path: assets/svg/app_icon.svg
  String get appIcon => 'assets/svg/app_icon.svg';

  /// File path: assets/svg/calendar.svg
  String get calendar => 'assets/svg/calendar.svg';

  /// File path: assets/svg/day_icon.svg
  String get dayIcon => 'assets/svg/day_icon.svg';

  /// File path: assets/svg/es.svg
  String get es => 'assets/svg/es.svg';

  /// File path: assets/svg/night_icon.svg
  String get nightIcon => 'assets/svg/night_icon.svg';

  /// File path: assets/svg/option.svg
  String get option => 'assets/svg/option.svg';

  /// File path: assets/svg/sort.svg
  String get sort => 'assets/svg/sort.svg';

  /// File path: assets/svg/technical.svg
  String get technical => 'assets/svg/technical.svg';

  /// File path: assets/svg/us-flag.svg
  String get usFlag => 'assets/svg/us-flag.svg';

  /// File path: assets/svg/vietnam-flag.svg
  String get vietnamFlag => 'assets/svg/vietnam-flag.svg';

  /// List of all assets
  List<String> get values => [
        appIcon,
        calendar,
        dayIcon,
        es,
        nightIcon,
        option,
        sort,
        technical,
        usFlag,
        vietnamFlag
      ];
}

class $AssetsSvgWiFiSignalGen {
  const $AssetsSvgWiFiSignalGen();

  /// File path: assets/svg/WiFi Signal/Dark.svg
  String get dark => 'assets/svg/WiFi Signal/Dark.svg';

  /// List of all assets
  List<String> get values => [dark];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
