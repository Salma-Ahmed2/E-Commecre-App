import 'package:flutter/material.dart';
import 'package:fruits_app/Core/Services/shared_preferences_singleton.dart';
import 'package:fruits_app/Core/Widgets/constant.dart';
import 'package:fruits_app/Core/utils/app_images.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/Login/Views/login_view.dart';
import 'package:fruits_app/Feauters/OnBording/Presentation/Views/on_boarding_view.dart';
import 'package:lottie/lottie.dart';

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
    return Center(
      child: Lottie.asset(Assets.imagesAnimation),
    );
  }
  // Column(
  //   crossAxisAlignment: CrossAxisAlignment.stretch,
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: [
  //     Row(
  //       // mainAxisAlignment: MainAxisAlignment.start, if the languge is English
  //       mainAxisAlignment: MainAxisAlignment.end, //if the languge is Arabic
  //       children: [
  //         SvgPicture.asset(Assets.imagesTree),
  //       ],
  //     ),
  //     Lottie.asset('assets/images/Animation - 1721585430497.json'),
  //     // SvgPicture.asset(
  //     //   Assets.imagesLogo,
  //     // ),
  //     SvgPicture.asset(
  //       Assets.imagesSomePoint,
  //       fit: BoxFit.fill,
  //     ),
  //   ],
  // );

  void excuteNavigation() {
    bool isOnBoardingViewSeen =
        SharedPreferencesSingleton.getBool(kIsOnBoardingViewSeen);
    Future.delayed(const Duration(seconds: 6), () {
      if (isOnBoardingViewSeen) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
