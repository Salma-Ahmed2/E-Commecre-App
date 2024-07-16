import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_colors.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';

class CustomTextDontHaveAccount extends StatelessWidget {
  const CustomTextDontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: ' لا تمتلك حساب ؟',
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
          TextSpan(
              // onEnter: (event) => Navigator.of(context)
              //     .pushReplacementNamed(SplashView.routeName),
              text: ' قم بإنشاء حساب  ',
              style: TextStyles.semiBold16.copyWith(
                color: AppColors.primaryColor,
              )),
        ],
      ),
    );
  }
}
