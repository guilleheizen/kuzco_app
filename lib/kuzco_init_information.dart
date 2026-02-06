import 'package:flutter/material.dart';
import 'package:kuzco_app/ui/widgets/app_icons.dart';

class KuzcoInitInformation {
  final String _discoveryUrl;
  final String _fullImageUrl;
  final String _thumbnailImageUrl;
  final String _privateKey;
  final String _publicKey;
  final String _version;
  final ThemeData _lightTheme;
  final ThemeData _darkTheme;
  final AppIcons _appIcons;

  static KuzcoInitInformation? _instance;

  static KuzcoInitInformation? get get {
    return _instance;
  }

  String get discoveryUrl {
    return _discoveryUrl;
  }

  String get fullImageUrl {
    return _fullImageUrl;
  }

  String get thumbnailImageUrl {
    return _thumbnailImageUrl;
  }

  String get privateKey {
    return _privateKey;
  }

  String get publicKey {
    return _publicKey;
  }

  String get version {
    return _version;
  }

  ThemeData get lightTheme {
    return _lightTheme;
  }

  ThemeData get darkTheme {
    return _darkTheme;
  }

  AppIcons get appIcons {
    return _appIcons;
  }

  factory KuzcoInitInformation({
    required String discoveryUrl,
    required String fullImageUrl,
    required String thumbnailImageUrl,
    required String privateKey,
    required String publicKey,
    required String version,
    required ThemeData lightTheme,
    required ThemeData darkTheme,
    required AppIcons appIcons,
  }) {
    _instance ??= KuzcoInitInformation._internal(discoveryUrl, fullImageUrl, thumbnailImageUrl, privateKey, publicKey, version, lightTheme, darkTheme, appIcons);
    return _instance!;
  }

  KuzcoInitInformation._internal(this._discoveryUrl, this._fullImageUrl, this._thumbnailImageUrl, this._privateKey, this._publicKey, this._version, this._lightTheme, this._darkTheme, this._appIcons);
}
