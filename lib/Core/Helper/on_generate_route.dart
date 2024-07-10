import 'package:flutter/material.dart';
import 'package:fruits_app/Feauters/OnBording/Presentation/Views/on_boarding_view.dart';
import 'package:fruits_app/Feauters/Splash/Presentation/Views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
