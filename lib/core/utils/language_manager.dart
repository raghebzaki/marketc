// ignore_for_file: constant_identifier_names

import 'app_constants.dart';

enum LanguageType {
  ENGLISH,
  ARABIC,
}

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return AppConstants.english;
      case LanguageType.ARABIC:
        return AppConstants.arabic;
    }
  }
}