/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add.svg
  String get add => 'assets/icons/add.svg';

  /// File path: assets/icons/arrow-right.svg
  String get arrowRight => 'assets/icons/arrow-right.svg';

  /// File path: assets/icons/attachment-1483.svg
  String get attachment1483 => 'assets/icons/attachment-1483.svg';

  /// File path: assets/icons/check.svg
  String get check => 'assets/icons/check.svg';

  /// File path: assets/icons/close.svg
  String get close => 'assets/icons/close.svg';

  /// File path: assets/icons/download.svg
  String get download => 'assets/icons/download.svg';

  /// File path: assets/icons/filter.svg
  String get filter => 'assets/icons/filter.svg';

  /// File path: assets/icons/folder.svg
  String get folder => 'assets/icons/folder.svg';

  /// File path: assets/icons/group.svg
  String get group => 'assets/icons/group.svg';

  /// File path: assets/icons/lock.svg
  String get lock => 'assets/icons/lock.svg';

  /// File path: assets/icons/mail.svg
  String get mail => 'assets/icons/mail.svg';

  /// File path: assets/icons/paperclip-2.svg
  String get paperclip2 => 'assets/icons/paperclip-2.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// List of all assets
  List<String> get values =>
      [add, arrowRight, attachment1483, check, close, download, filter, folder, group, lock, mail, paperclip2, search];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/loading_error_state.png
  AssetGenImage get loadingErrorState => const AssetGenImage('assets/images/loading_error_state.png');

  /// List of all assets
  List<AssetGenImage> get values => [loadingErrorState];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/logos/logo.png');

  /// File path: assets/logos/logo2.svg
  String get logo2 => 'assets/logos/logo2.svg';

  /// File path: assets/logos/logo3.svg
  String get logo3 => 'assets/logos/logo3.svg';

  /// File path: assets/logos/logo_test.png
  AssetGenImage get logoTest => const AssetGenImage('assets/logos/logo_test.png');

  /// File path: assets/logos/mtn_momo 1.svg
  String get mtnMomo1 => 'assets/logos/mtn_momo 1.svg';

  /// File path: assets/logos/orange1.svg
  String get orange1 => 'assets/logos/orange1.svg';

  /// List of all assets
  List<dynamic> get values => [logo, logo2, logo3, logoTest, mtnMomo1, orange1];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogosGen logos = $AssetsLogosGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
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
