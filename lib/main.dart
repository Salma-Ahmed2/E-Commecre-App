import 'package:flutter/material.dart';
import 'package:fruits_app/Core/Helper/on_generate_route.dart';
import 'package:fruits_app/Feauters/Splash/Presentation/Views/splash_view.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
