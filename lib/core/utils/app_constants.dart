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
  static const checkEmailRegisterUri = "auth/check_email_before_register";
  static const resendCodeUri = "auth/resend-code";
  static const mostPopularProductsUri = "v1/products/popular";
  static const newProductsUri = "v1/products";
  static const favoriteProductsUri = "v1/products/get-my-favourite";
  static const addFavoriteProductsUri = "v1/products/add-to-favourite";
  static const checkIfFavoriteProductsUri = "v1/products/check-if-favourite";
  static const categoryDetailsUri = "";
  static const placeOrderUri = "";
  static const addPromoCodeUri = "";
  static const carouselUri = "";
  static const categoryUri = "v1/categories";
  static const subCategoryUri = "v1/sub-categories";
  static const getMyOrdersUri = "";
  static const contactUsUri = "";
  static const editUserProfileUri = "";
  static const deleteUserAccountUri = "";

/// designer
  static const designerCarouselUri = "";
  static const designsUri = "";
  static const designerDeleteProduct = "";
  static const designerAddProduct = "";
  static const designerGetPoints = "";
  static const designerBalance = "";
  static const designerExchange  = "";
  static const getColors  = "v1/colors";

}