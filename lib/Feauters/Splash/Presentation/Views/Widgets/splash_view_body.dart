import 'package:flutter/material.dart';
import 'package:fruits_app/Core/Services/shared_preferences_singleton.dart';
import 'package:fruits_app/Core/Widgets/constant.dart';
import 'package:fruits_app/Core/utils/app_images.dart';
import 'package:fruits_app/Feauters/AuthVacation/Presentation/Views/login_views.dart';
import 'package:fruits_app/Feauters/OnBording/Presentation/Views/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start, if the languge is English
          mainAxisAlignment: MainAxisAlignment.end, //if the languge is Arabic
          children: [
            SvgPicture.asset(Assets.imagesTree),
          ],
        ),
        SvgPicture.asset(
          Assets.imagesLogo,
        ),
        SvgPicture.asset(
          Assets.imagesSomePoint,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNavigation() {
    bool isOnBoardingViewSeen =
        SharedPreferencesSingleton.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
