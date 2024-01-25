//----------------Navigators (Inspired by Getx) #start#---------------------//

import 'package:flutter/material.dart';
import 'package:upcoming_movies/constant/screen_name_constants.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

final imagePlaceholder="https://img.freepik.com/premium-vector/photo-icon-picture-icon-image-sign-symbol-vector-illustration_64749-4409.jpg";

popScreen({var val}) {
  if (Navigator.canPop(NavigationService.navigatorKey.currentState!.context)) {
    Navigator.pop(NavigationService.navigatorKey.currentState!.context, val);
  } else {
    replaceUntil(routeName: dashboardScreen);
  }
}

push({required String routeName, Map? arguments}) {
  Navigator.pushNamed(
      NavigationService.navigatorKey.currentState!.context, routeName,
      arguments: arguments);
}

replace({required String routeName, Map? arguments}) {
  Navigator.pushReplacementNamed(
      NavigationService.navigatorKey.currentState!.context, routeName,
      arguments: arguments);
}

replaceUntil({required String routeName, Map? arguments}) {
  Navigator.pushNamedAndRemoveUntil(
      NavigationService.navigatorKey.currentState!.context,
      routeName,
      arguments: arguments,
      (routes) => false);
}
//----------------Navigators (Inspired by Getx) #end#---------------------//
