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

  /// `bad request. try again later`
  String get bad_request_error {
    return Intl.message(
      'bad request. try again later',
      name: 'bad_request_error',
      desc: '',
      args: [],
    );
  }

  /// `Buyer`
  String get buyer {
    return Intl.message(
      'Buyer',
      name: 'buyer',
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

  /// `Change Password`
  String get change_pass {
    return Intl.message(
      'Change Password',
      name: 'change_pass',
      desc: '',
      args: [],
    );
  }

  /// `Change your password`
  String get change_your_pass {
    return Intl.message(
      'Change your password',
      name: 'change_your_pass',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email to secure your account`
  String get check_your_mail {
    return Intl.message(
      'Please check your email to secure your account',
      name: 'check_your_mail',
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

  /// `Customer Support`
  String get cs {
    return Intl.message(
      'Customer Support',
      name: 'cs',
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

  /// `Don't have an account?`
  String get do_not_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'do_not_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password below`
  String get enter_pass_below {
    return Intl.message(
      'Enter your new password below',
      name: 'enter_pass_below',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
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

  /// `Forgot Pass`
  String get forgot_pass {
    return Intl.message(
      'Forgot Pass',
      name: 'forgot_pass',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Have a problem?`
  String get have_problem {
    return Intl.message(
      'Have a problem?',
      name: 'have_problem',
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

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get login_now {
    return Intl.message(
      'Login Now',
      name: 'login_now',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
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

  /// `Please check your internet connection`
  String get no_internet_error {
    return Intl.message(
      'Please check your internet connection',
      name: 'no_internet_error',
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

  /// `Clothing Exhibition`
  String get onboard_1 {
    return Intl.message(
      'Clothing Exhibition',
      name: 'onboard_1',
      desc: '',
      args: [],
    );
  }

  /// `We offer a diverse range of sizes and styles, allowing you to choose your clothes with elegance and distinction.`
  String get onboard_1_des {
    return Intl.message(
      'We offer a diverse range of sizes and styles, allowing you to choose your clothes with elegance and distinction.',
      name: 'onboard_1_des',
      desc: '',
      args: [],
    );
  }

  /// `Specializing in\nClothing Embroidery`
  String get onboard_2 {
    return Intl.message(
      'Specializing in\nClothing Embroidery',
      name: 'onboard_2',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy the embroidery of logos and phrases you love on your own clothes.`
  String get onboard_2_des {
    return Intl.message(
      'Enjoy the embroidery of logos and phrases you love on your own clothes.',
      name: 'onboard_2_des',
      desc: '',
      args: [],
    );
  }

  /// `Shop Online`
  String get onboard_3 {
    return Intl.message(
      'Shop Online',
      name: 'onboard_3',
      desc: '',
      args: [],
    );
  }

  /// `Hurry to purchase your embroidered and distinctive clothing `
  String get onboard_3_des {
    return Intl.message(
      'Hurry to purchase your embroidered and distinctive clothing ',
      name: 'onboard_3_des',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get pass {
    return Intl.message(
      'Password',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Successfully`
  String get pass_change_success {
    return Intl.message(
      'Password Changed Successfully',
      name: 'pass_change_success',
      desc: '',
      args: [],
    );
  }

  /// `Password Confirmation`
  String get pass_confirm {
    return Intl.message(
      'Password Confirmation',
      name: 'pass_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get register_now {
    return Intl.message(
      'Register Now',
      name: 'register_now',
      desc: '',
      args: [],
    );
  }

  /// `Remember password?`
  String get remember_pass {
    return Intl.message(
      'Remember password?',
      name: 'remember_pass',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resend_code {
    return Intl.message(
      'Resend Code',
      name: 'resend_code',
      desc: '',
      args: [],
    );
  }

  /// `Seller`
  String get seller {
    return Intl.message(
      'Seller',
      name: 'seller',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get send_code {
    return Intl.message(
      'Send Code',
      name: 'send_code',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
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

  /// `time out, try again late`
  String get timeout_error {
    return Intl.message(
      'time out, try again late',
      name: 'timeout_error',
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

  /// `some thing went wrong, try again later`
  String get unknown_error {
    return Intl.message(
      'some thing went wrong, try again later',
      name: 'unknown_error',
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

  /// `Verify Code`
  String get verify_code {
    return Intl.message(
      'Verify Code',
      name: 'verify_code',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code sent to your email`
  String get verify_code_sent {
    return Intl.message(
      'Verification Code sent to your email',
      name: 'verify_code_sent',
      desc: '',
      args: [],
    );
  }

  /// `What are you thinking about?`
  String get you_think {
    return Intl.message(
      'What are you thinking about?',
      name: 'you_think',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to shopping world`
  String get shopping_world {
    return Intl.message(
      'Welcome to shopping world',
      name: 'shopping_world',
      desc: '',
      args: [],
    );
  }

  /// `Let's help you find the right clothing for you\n and embroider the logo and phrases you love`
  String get slogan {
    return Intl.message(
      'Let\'s help you find the right clothing for you\n and embroider the logo and phrases you love',
      name: 'slogan',
      desc: '',
      args: [],
    );
  }

  /// `Soon`
  String get soon {
    return Intl.message(
      'Soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `Embroidery logos`
  String get custom_logo {
    return Intl.message(
      'Embroidery logos',
      name: 'custom_logo',
      desc: '',
      args: [],
    );
  }

  /// `A wide range of distinctive logos & phrases that are uniquely and distinctively embroidered`
  String get wide_range {
    return Intl.message(
      'A wide range of distinctive logos & phrases that are uniquely and distinctively embroidered',
      name: 'wide_range',
      desc: '',
      args: [],
    );
  }

  /// `Browse Now`
  String get browse_now {
    return Intl.message(
      'Browse Now',
      name: 'browse_now',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `Most Popular`
  String get popular {
    return Intl.message(
      'Most Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `More...`
  String get more {
    return Intl.message(
      'More...',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Newly Released`
  String get new_releases {
    return Intl.message(
      'Newly Released',
      name: 'new_releases',
      desc: '',
      args: [],
    );
  }

  /// `SAR`
  String get sar {
    return Intl.message(
      'SAR',
      name: 'sar',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get view_details {
    return Intl.message(
      'View Details',
      name: 'view_details',
      desc: '',
      args: [],
    );
  }

  /// `Short Clothes`
  String get short_cloths {
    return Intl.message(
      'Short Clothes',
      name: 'short_cloths',
      desc: '',
      args: [],
    );
  }

  /// `Custom Phrases Embroidery`
  String get custom_phrases {
    return Intl.message(
      'Custom Phrases Embroidery',
      name: 'custom_phrases',
      desc: '',
      args: [],
    );
  }

  /// `Short clothes with embroidered phrases, where you can choose clothes with suitable embroidery to add a touch of elegance to your identity.`
  String get product_des {
    return Intl.message(
      'Short clothes with embroidered phrases, where you can choose clothes with suitable embroidery to add a touch of elegance to your identity.',
      name: 'product_des',
      desc: '',
      args: [],
    );
  }

  /// `Colors`
  String get colors {
    return Intl.message(
      'Colors',
      name: 'colors',
      desc: '',
      args: [],
    );
  }

  /// `Sizes`
  String get sizes {
    return Intl.message(
      'Sizes',
      name: 'sizes',
      desc: '',
      args: [],
    );
  }

  /// `Add to Cart`
  String get add_to_cart {
    return Intl.message(
      'Add to Cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get qty {
    return Intl.message(
      'Quantity',
      name: 'qty',
      desc: '',
      args: [],
    );
  }

  /// `Short Clothing Category`
  String get short_cloth_category {
    return Intl.message(
      'Short Clothing Category',
      name: 'short_cloth_category',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `favorite`
  String get favorite {
    return Intl.message(
      'favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get user_profile {
    return Intl.message(
      'Profile',
      name: 'user_profile',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Saved Address`
  String get saved_address {
    return Intl.message(
      'Saved Address',
      name: 'saved_address',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Allow notifications`
  String get allow_notifications {
    return Intl.message(
      'Allow notifications',
      name: 'allow_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Offers and discounts`
  String get offers_and_discounts {
    return Intl.message(
      'Offers and discounts',
      name: 'offers_and_discounts',
      desc: '',
      args: [],
    );
  }

  /// `New updates`
  String get new_updates {
    return Intl.message(
      'New updates',
      name: 'new_updates',
      desc: '',
      args: [],
    );
  }

  /// `Status of orders`
  String get status_of_orders {
    return Intl.message(
      'Status of orders',
      name: 'status_of_orders',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `send`
  String get send {
    return Intl.message(
      'send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `choose language`
  String get change_language {
    return Intl.message(
      'choose language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Our privacy policy describes how we retain and process your personal information, what we keep about you, how and why we obtain this information from you, your rights, with whom we share your personal information, the duration of our information retention, and how we maintain the security of your data.`
  String get privacy_des_1 {
    return Intl.message(
      'Our privacy policy describes how we retain and process your personal information, what we keep about you, how and why we obtain this information from you, your rights, with whom we share your personal information, the duration of our information retention, and how we maintain the security of your data.',
      name: 'privacy_des_1',
      desc: '',
      args: [],
    );
  }

  /// `Based on family values, we see each customer as one of us and respect the protection of your privacy. We want you to understand how we use your personal information to provide you with the solutions and services you need. If you have any questions, reach out to us through our application, or call us at + (966) 798743333, or email us at ForYou@Support.com.`
  String get privacy_des_2 {
    return Intl.message(
      'Based on family values, we see each customer as one of us and respect the protection of your privacy. We want you to understand how we use your personal information to provide you with the solutions and services you need. If you have any questions, reach out to us through our application, or call us at + (966) 798743333, or email us at ForYou@Support.com.',
      name: 'privacy_des_2',
      desc: '',
      args: [],
    );
  }

  /// `If we change the way we process and use your personal information, we will notify you immediately via email and by updating our application.`
  String get privacy_des_3 {
    return Intl.message(
      'If we change the way we process and use your personal information, we will notify you immediately via email and by updating our application.',
      name: 'privacy_des_3',
      desc: '',
      args: [],
    );
  }

  /// `What We Hold About You`
  String get about_you {
    return Intl.message(
      'What We Hold About You',
      name: 'about_you',
      desc: '',
      args: [],
    );
  }

  /// `We collect and process personal information throughout our journey together to maintain the security of your account. Here's what we keep about you:`
  String get about_you_des_1 {
    return Intl.message(
      'We collect and process personal information throughout our journey together to maintain the security of your account. Here\'s what we keep about you:',
      name: 'about_you_des_1',
      desc: '',
      args: [],
    );
  }

  /// `• Information you provide through our application`
  String get your_info_1 {
    return Intl.message(
      '• Information you provide through our application',
      name: 'your_info_1',
      desc: '',
      args: [],
    );
  }

  /// `Your Order has been Confirmed!`
  String get order_confirmed {
    return Intl.message(
      'Your Order has been Confirmed!',
      name: 'order_confirmed',
      desc: '',
      args: [],
    );
  }

  /// `We have received your order, and we are busy preparing it for you. We will contact you when it's ready for pickup. Thank you for choosing us!`
  String get order_confirmed_msg {
    return Intl.message(
      'We have received your order, and we are busy preparing it for you. We will contact you when it\'s ready for pickup. Thank you for choosing us!',
      name: 'order_confirmed_msg',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Order`
  String get track_order_btn {
    return Intl.message(
      'Track Your Order',
      name: 'track_order_btn',
      desc: '',
      args: [],
    );
  }

  /// `Continue Browsing`
  String get continue_browsing {
    return Intl.message(
      'Continue Browsing',
      name: 'continue_browsing',
      desc: '',
      args: [],
    );
  }

  /// `In case you encounter any issues, you can contact`
  String get order_problem {
    return Intl.message(
      'In case you encounter any issues, you can contact',
      name: 'order_problem',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get order_no {
    return Intl.message(
      'Order Number',
      name: 'order_no',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Arrival Time`
  String get est {
    return Intl.message(
      'Estimated Arrival Time',
      name: 'est',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancel_order {
    return Intl.message(
      'Cancel Order',
      name: 'cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel this order?`
  String get cancel_alert {
    return Intl.message(
      'Are you sure you want to cancel this order?',
      name: 'cancel_alert',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Cancel`
  String get cancel_yes {
    return Intl.message(
      'Yes, Cancel',
      name: 'cancel_yes',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Track Order`
  String get track_order {
    return Intl.message(
      'Track Order',
      name: 'track_order',
      desc: '',
      args: [],
    );
  }

  /// `Prepare Order`
  String get prepare_order {
    return Intl.message(
      'Prepare Order',
      name: 'prepare_order',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get done {
    return Intl.message(
      'Completed',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get processing {
    return Intl.message(
      'Processing',
      name: 'processing',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Arriving To`
  String get arriving_to {
    return Intl.message(
      'Arriving To',
      name: 'arriving_to',
      desc: '',
      args: [],
    );
  }

  /// `Executed Request`
  String get executed_request {
    return Intl.message(
      'Executed Request',
      name: 'executed_request',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get delivery_fee {
    return Intl.message(
      'Delivery Fee',
      name: 'delivery_fee',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get cart {
    return Intl.message(
      'Shopping Cart',
      name: 'cart',
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
