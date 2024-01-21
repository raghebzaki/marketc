class AppConstants {
  static RegExp emailRegExp = RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  static RegExp passRegExp = RegExp(r"(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\\$&*~]).{8,}");
  static RegExp phoneRegExp = RegExp(r"(?:[+0][1-9])?[0-9]{9,12}");

  //? Consts for language manager
  static const arabic = "ar";
  static const english = "en";
  static const prefsLangKey = "prefsLangKey";

  // * Main UI constants
  static const mainFontFamily = "Readex Pro";
  static const subFontFamily = "Abhaya Libre";
  static const unknownStringValue = "UNKNOWN STRING VALUE";
  static const unknownNumValue = 2077;

  //! API headers
  static const String applicationJson = "application/json";
  static const apiToken = "Send Token Here";
  static const apiTimeOut = 60000;
  static String? fcmToken = "";

  // * API URIs
  static const apiBaseUrl = "https://crm.coddiv.com/api/";
  static const imageUrl = "https://crm.coddiv.com/";
  static const loginUri = "auth/login";
  static const forgotPassUri = "auth/forget-password";
  static const resetPassUri = "auth/reset-password";
  static const changePassUri = "auth/change-password";
  static const registerUri = "auth/register";
  static const verifyAccountUri = "auth/account_verification";
  static const checkEmailRegisterUri = "";
  static const resendCodeUri = "";
  static const mostPopularProductsUri = "";
  static const newProductsUri = "";
  static const favoriteProductsUri = "";

}