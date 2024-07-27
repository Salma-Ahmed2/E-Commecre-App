import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_colors.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';
import 'package:flutter/gestures.dart';

class CustomTextAccount extends StatelessWidget {
  const CustomTextAccount(
      {super.key,
      required this.titleHaveAccountOrNot,
      required this.titleNewAccount,
      required this.onTap});
  final String titleHaveAccountOrNot, titleNewAccount;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: titleHaveAccountOrNot,
            style: TextStyles.semiBold16.copyWith(
              color: const Color(0xff949D9E),
            ),
          ),
          TextSpan(
            text: titleNewAccount,
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
            // Navigator.pushNamed(context, SignUpView.routeName);
          ),
        ],
      ),
    );
  }
}
