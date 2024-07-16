import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/Core/Services/shared_preferences_singleton.dart';
import 'package:fruits_app/Core/Widgets/constant.dart';
import 'package:fruits_app/Core/Widgets/custom_button.dart';
import 'package:fruits_app/Core/utils/app_colors.dart';
import 'package:fruits_app/Feauters/OnBording/Presentation/Views/Widgets/on_boarding_page_view.dart';

import '../../../../AuthVacation/Presentation/Views/login_views.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            size: const Size(30, 11),
            spacing: const EdgeInsets.all(0),
            activeColor: AppColors.primaryColor,
            color: currentPage == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          height: 29,
        ),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
            ),
            child: CustomButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(LoginView.routeName);

                SharedPreferencesSingleton.setBool(kIsOnBoardingViewSeen, true);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        const SizedBox(
          height: 43,
        ),
      ],
    );
  }
}
