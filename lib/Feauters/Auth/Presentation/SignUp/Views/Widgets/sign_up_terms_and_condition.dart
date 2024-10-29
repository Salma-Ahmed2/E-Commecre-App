import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_colors.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/SignUp/Views/Widgets/custom_check_box.dart';

class SignUpTermsAndCondition extends StatefulWidget {
  const SignUpTermsAndCondition({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;

  @override
  State<SignUpTermsAndCondition> createState() =>
      _SignUpTermsAndConditionState();
}

class _SignUpTermsAndConditionState extends State<SignUpTermsAndCondition> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.semibold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: TextStyles.semibold13.copyWith(
                    color: AppColors.primary1Color,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semibold13.copyWith(
                    color: const Color(0xFF616A6B),
                  ),
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: TextStyles.semibold13.copyWith(
                    color: AppColors.primary1Color,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: TextStyles.semibold13.copyWith(
                    color: const Color(0xFF616A6B),
                  ),
                ),
                TextSpan(
                  text: 'بنا',
                  style: TextStyles.semibold13.copyWith(
                    color: AppColors.primary1Color,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
