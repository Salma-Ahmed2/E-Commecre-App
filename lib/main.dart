import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_app/Core/Helper/on_generate_route.dart';
import 'package:fruits_app/Core/Services/custom_bloc_observer.dart';
import 'package:fruits_app/Core/Services/get_it_services.dart';
import 'package:fruits_app/Core/Services/shared_preferences_singleton.dart';
import 'package:fruits_app/Feauters/Splash/Presentation/Views/splash_view.dart';
import 'package:fruits_app/firebase_options.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesSingleton.init();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Prefs.init();

  setupGetIt();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Colors.grey,
        ),
        fontFamily: 'Cairo',
        // scaffoldBackgroundColor: const Color.fromARGB(255, 183, 236, 122),
        // scaffoldBackgroundColor: Color.fromARGB(255, 211, 238, 181),
        // scaffoldBackgroundColor: Color.fromARGB(255, 204, 219, 191),
        // scaffoldBackgroundColor: Colors.black,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
