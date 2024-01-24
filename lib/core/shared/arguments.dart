import 'package:geocoding/geocoding.dart';

class VerifyAccountArgs {
  final String email;

  VerifyAccountArgs({required this.email});
}

class ResetPassArgs {
  final String email;

  ResetPassArgs({required this.email});
}

class ChangePassArgs {
  final String email;

  ChangePassArgs({required this.email});
}

class CategoryDetailsArgs {
  final num id;

  CategoryDetailsArgs({required this.id});
}

class NewAddressArgs {
  final Placemark address;

  NewAddressArgs({required this.address});
}
