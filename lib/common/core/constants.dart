import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> snackBarKey =
      GlobalKey<ScaffoldMessengerState>();

  static Future<dynamic> pushNamed(
    String routeName, {
    dynamic argument,
  }) async {
    await navigatorKey.currentState
        ?.pushNamed<dynamic>(routeName, arguments: argument);
  }
 

 
  static const whatIs = "APKFYP is a user-friendly platform designed to simplify the process of downloading APK files for Android devices. Whether you’re searching for the latest games, essential utilities, or premium applications without the cost, APKFYP has you covered. Our mission is to ensure that you have instant access to high-quality APKs that enhance your mobile experience.";
  static const welcome = 'Welcome to APKFYP, your premier destination for free APK downloads tailored specifically for Android users. With an extensive selection of games and premium applications, we aim to provide you with an unparalleled experience in accessing the best mobile software available today.';
}
