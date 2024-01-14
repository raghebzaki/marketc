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

  /// `success`
  String get success {
    return Intl.message(
      'success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `bad request. try again later`
  String get bad_request_error {
    return Intl.message(
      'bad request. try again later',
      name: 'bad_request_error',
      desc: '',
      args: [],
    );
  }

  /// `success with not content`
  String get no_content {
    return Intl.message(
      'success with not content',
      name: 'no_content',
      desc: '',
      args: [],
    );
  }

  /// `forbidden request. try again later`
  String get forbidden_error {
    return Intl.message(
      'forbidden request. try again later',
      name: 'forbidden_error',
      desc: '',
      args: [],
    );
  }

  /// `user unauthorized, try again later`
  String get unauthorized_error {
    return Intl.message(
      'user unauthorized, try again later',
      name: 'unauthorized_error',
      desc: '',
      args: [],
    );
  }

  /// `unprocessable data, check it and try again`
  String get unprocessable_content_error {
    return Intl.message(
      'unprocessable data, check it and try again',
      name: 'unprocessable_content_error',
      desc: '',
      args: [],
    );
  }

  /// `url not found, try again later`
  String get not_found_error {
    return Intl.message(
      'url not found, try again later',
      name: 'not_found_error',
      desc: '',
      args: [],
    );
  }

  /// `conflict found, try again later`
  String get conflict_error {
    return Intl.message(
      'conflict found, try again later',
      name: 'conflict_error',
      desc: '',
      args: [],
    );
  }

  /// `some thing went wrong, try again later`
  String get internal_server_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'internal_server_error',
      desc: '',
      args: [],
    );
  }

  /// `some thing went wrong, try again later`
  String get unknown_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `time out, try again late`
  String get timeout_error {
    return Intl.message(
      'time out, try again late',
      name: 'timeout_error',
      desc: '',
      args: [],
    );
  }

  /// `some thing went wrong, try again later`
  String get default_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'default_error',
      desc: '',
      args: [],
    );
  }

  /// `cache error, try again later`
  String get cache_error {
    return Intl.message(
      'cache error, try again later',
      name: 'cache_error',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection`
  String get no_internet_error {
    return Intl.message(
      'Please check your internet connection',
      name: 'no_internet_error',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
