import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';
import 'package:fruits_app/Feauters/Splash/Presentation/Views/splash_view.dart';
import '../../../../../Core/utils/app_colors.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(SplashView.routeName);
          },
          child: Text(
            'نسيت كلمة المرور؟',
            style: TextStyles.semibold14.copyWith(
              color: AppColors.lightPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
