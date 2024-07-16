import 'package:flutter/material.dart';
import 'package:fruits_app/Feauters/Splash/Presentation/Views/Widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = 'Splash';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashViewBody(),
    );
  }
}
