import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_app/Core/Services/shared_preferences_singleton.dart';
import 'package:fruits_app/Core/Widgets/constant.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';
import 'package:fruits_app/Feauters/AuthVacation/Presentation/Views/login_views.dart';
import 'package:svg_flutter/svg_flutter.dart';

class PageViewItemOne extends StatelessWidget {
  const PageViewItemOne(
      {super.key,
      required this.image,
      required this.backgroundImage,
      required this.subTitle,
      required this.title,
      required this.isVisible});

  final String image, backgroundImage;
  final String subTitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.55,
          child: Stack(
            children: [
              Positioned.fill(child: SvgPicture.asset(backgroundImage)),
              Positioned(
                  bottom: 0, left: 0, right: 0, child: SvgPicture.asset(image)),
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    SharedPreferencesSingleton.setBool(
                        kIsOnBoardingViewSeen, true);

                    Navigator.of(context)
                        .pushReplacementNamed(LoginView.routeName);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, top: 39),
                    child: Text(
                      'تخطِ',
                      style: TextStyles.regular17
                          .copyWith(color: const Color(0xff949D9E)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
            style: TextStyles.semiBold15.copyWith(
              color: const Color(0xFF4E5556),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
