// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Make`
  String get Make {
    return Intl.message(
      'Make',
      name: 'Make',
      desc: '',
      args: [],
    );
  }

  /// `Model`
  String get Model {
    return Intl.message(
      'Model',
      name: 'Model',
      desc: '',
      args: [],
    );
  }

  /// `ImageWidth`
  String get ImageWidth {
    return Intl.message(
      'ImageWidth',
      name: 'ImageWidth',
      desc: '',
      args: [],
    );
  }

  /// `ImageLength`
  String get ImageLength {
    return Intl.message(
      'ImageLength',
      name: 'ImageLength',
      desc: '',
      args: [],
    );
  }

  /// `Resolution`
  String get Resolution {
    return Intl.message(
      'Resolution',
      name: 'Resolution',
      desc: '',
      args: [],
    );
  }

  /// `ResolutionUnit`
  String get ResolutionUnit {
    return Intl.message(
      'ResolutionUnit',
      name: 'ResolutionUnit',
      desc: '',
      args: [],
    );
  }

  /// `Software`
  String get Software {
    return Intl.message(
      'Software',
      name: 'Software',
      desc: '',
      args: [],
    );
  }

  /// `DateTime`
  String get DateTime {
    return Intl.message(
      'DateTime',
      name: 'DateTime',
      desc: '',
      args: [],
    );
  }

  /// `Compression`
  String get Compression {
    return Intl.message(
      'Compression',
      name: 'Compression',
      desc: '',
      args: [],
    );
  }

  /// `ExposureTime`
  String get ExposureTime {
    return Intl.message(
      'ExposureTime',
      name: 'ExposureTime',
      desc: '',
      args: [],
    );
  }

  /// `FNumber`
  String get FNumber {
    return Intl.message(
      'FNumber',
      name: 'FNumber',
      desc: '',
      args: [],
    );
  }

  /// `ExposureProgram`
  String get ExposureProgram {
    return Intl.message(
      'ExposureProgram',
      name: 'ExposureProgram',
      desc: '',
      args: [],
    );
  }

  /// `ISOSpeedRatings`
  String get ISOSpeedRatings {
    return Intl.message(
      'ISOSpeedRatings',
      name: 'ISOSpeedRatings',
      desc: '',
      args: [],
    );
  }

  /// `DateTimeOriginal`
  String get DateTimeOriginal {
    return Intl.message(
      'DateTimeOriginal',
      name: 'DateTimeOriginal',
      desc: '',
      args: [],
    );
  }

  /// `OffsetTime`
  String get OffsetTime {
    return Intl.message(
      'OffsetTime',
      name: 'OffsetTime',
      desc: '',
      args: [],
    );
  }

  /// `ShutterSpeedValue`
  String get ShutterSpeedValue {
    return Intl.message(
      'ShutterSpeedValue',
      name: 'ShutterSpeedValue',
      desc: '',
      args: [],
    );
  }

  /// `ApertureValue`
  String get ApertureValue {
    return Intl.message(
      'ApertureValue',
      name: 'ApertureValue',
      desc: '',
      args: [],
    );
  }

  /// `BrightnessValue`
  String get BrightnessValue {
    return Intl.message(
      'BrightnessValue',
      name: 'BrightnessValue',
      desc: '',
      args: [],
    );
  }

  /// `ExposureBiasValue`
  String get ExposureBiasValue {
    return Intl.message(
      'ExposureBiasValue',
      name: 'ExposureBiasValue',
      desc: '',
      args: [],
    );
  }

  /// `MaxApertureValue`
  String get MaxApertureValue {
    return Intl.message(
      'MaxApertureValue',
      name: 'MaxApertureValue',
      desc: '',
      args: [],
    );
  }

  /// `MeteringMode`
  String get MeteringMode {
    return Intl.message(
      'MeteringMode',
      name: 'MeteringMode',
      desc: '',
      args: [],
    );
  }

  /// `LightSource`
  String get LightSource {
    return Intl.message(
      'LightSource',
      name: 'LightSource',
      desc: '',
      args: [],
    );
  }

  /// `Flash`
  String get Flash {
    return Intl.message(
      'Flash',
      name: 'Flash',
      desc: '',
      args: [],
    );
  }

  /// `FocalLength`
  String get FocalLength {
    return Intl.message(
      'FocalLength',
      name: 'FocalLength',
      desc: '',
      args: [],
    );
  }

  /// `ComponentsConfiguration`
  String get ComponentsConfiguration {
    return Intl.message(
      'ComponentsConfiguration',
      name: 'ComponentsConfiguration',
      desc: '',
      args: [],
    );
  }

  /// `ColorSpace`
  String get ColorSpace {
    return Intl.message(
      'ColorSpace',
      name: 'ColorSpace',
      desc: '',
      args: [],
    );
  }

  /// `FileSource`
  String get FileSource {
    return Intl.message(
      'FileSource',
      name: 'FileSource',
      desc: '',
      args: [],
    );
  }

  /// `SceneType`
  String get SceneType {
    return Intl.message(
      'SceneType',
      name: 'SceneType',
      desc: '',
      args: [],
    );
  }

  /// `CustomRendered`
  String get CustomRendered {
    return Intl.message(
      'CustomRendered',
      name: 'CustomRendered',
      desc: '',
      args: [],
    );
  }

  /// `ExposureMode`
  String get ExposureMode {
    return Intl.message(
      'ExposureMode',
      name: 'ExposureMode',
      desc: '',
      args: [],
    );
  }

  /// `WhiteBalance`
  String get WhiteBalance {
    return Intl.message(
      'WhiteBalance',
      name: 'WhiteBalance',
      desc: '',
      args: [],
    );
  }

  /// `DigitalZoomRatio`
  String get DigitalZoomRatio {
    return Intl.message(
      'DigitalZoomRatio',
      name: 'DigitalZoomRatio',
      desc: '',
      args: [],
    );
  }

  /// `FocalLengthIn35mmFilm`
  String get FocalLengthIn35mmFilm {
    return Intl.message(
      'FocalLengthIn35mmFilm',
      name: 'FocalLengthIn35mmFilm',
      desc: '',
      args: [],
    );
  }

  /// `SceneCaptureType`
  String get SceneCaptureType {
    return Intl.message(
      'SceneCaptureType',
      name: 'SceneCaptureType',
      desc: '',
      args: [],
    );
  }

  /// `Contrast`
  String get Contrast {
    return Intl.message(
      'Contrast',
      name: 'Contrast',
      desc: '',
      args: [],
    );
  }

  /// `Saturation`
  String get Saturation {
    return Intl.message(
      'Saturation',
      name: 'Saturation',
      desc: '',
      args: [],
    );
  }

  /// `Sharpness`
  String get Sharpness {
    return Intl.message(
      'Sharpness',
      name: 'Sharpness',
      desc: '',
      args: [],
    );
  }

  /// `LensSpecification`
  String get LensSpecification {
    return Intl.message(
      'LensSpecification',
      name: 'LensSpecification',
      desc: '',
      args: [],
    );
  }

  /// `LensModel`
  String get LensModel {
    return Intl.message(
      'LensModel',
      name: 'LensModel',
      desc: '',
      args: [],
    );
  }

  /// `LensSerialNumber`
  String get LensSerialNumber {
    return Intl.message(
      'LensSerialNumber',
      name: 'LensSerialNumber',
      desc: '',
      args: [],
    );
  }

  /// `BodySerialNumber`
  String get BodySerialNumber {
    return Intl.message(
      'BodySerialNumber',
      name: 'BodySerialNumber',
      desc: '',
      args: [],
    );
  }

  /// `ImageDescription`
  String get ImageDescription {
    return Intl.message(
      'ImageDescription',
      name: 'ImageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Copyright`
  String get Copyright {
    return Intl.message(
      'Copyright',
      name: 'Copyright',
      desc: '',
      args: [],
    );
  }

  /// `GPSLatitudeRef`
  String get GPSLatitudeRef {
    return Intl.message(
      'GPSLatitudeRef',
      name: 'GPSLatitudeRef',
      desc: '',
      args: [],
    );
  }

  /// `GPSLatitude (DMS)`
  String get GPSLatitude {
    return Intl.message(
      'GPSLatitude (DMS)',
      name: 'GPSLatitude',
      desc: '',
      args: [],
    );
  }

  /// `GPSLongitudeRef`
  String get GPSLongitudeRef {
    return Intl.message(
      'GPSLongitudeRef',
      name: 'GPSLongitudeRef',
      desc: '',
      args: [],
    );
  }

  /// `GPSLongitude (DMS)`
  String get GPSLongitude {
    return Intl.message(
      'GPSLongitude (DMS)',
      name: 'GPSLongitude',
      desc: '',
      args: [],
    );
  }

  /// `GPSAltitudeRef`
  String get GPSAltitudeRef {
    return Intl.message(
      'GPSAltitudeRef',
      name: 'GPSAltitudeRef',
      desc: '',
      args: [],
    );
  }

  /// `GPSAltitude`
  String get GPSAltitude {
    return Intl.message(
      'GPSAltitude',
      name: 'GPSAltitude',
      desc: '',
      args: [],
    );
  }

  /// `GPSProcessingMethod`
  String get GPSProcessingMethod {
    return Intl.message(
      'GPSProcessingMethod',
      name: 'GPSProcessingMethod',
      desc: '',
      args: [],
    );
  }

  /// `GPSDate`
  String get GPSDate {
    return Intl.message(
      'GPSDate',
      name: 'GPSDate',
      desc: '',
      args: [],
    );
  }

  /// `Unknow`
  String get Unknow {
    return Intl.message(
      'Unknow',
      name: 'Unknow',
      desc: '',
      args: [],
    );
  }

  /// `SelectImage`
  String get SelectImage {
    return Intl.message(
      'SelectImage',
      name: 'SelectImage',
      desc: '',
      args: [],
    );
  }

  /// `ChangeImage`
  String get ChangeImage {
    return Intl.message(
      'ChangeImage',
      name: 'ChangeImage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
