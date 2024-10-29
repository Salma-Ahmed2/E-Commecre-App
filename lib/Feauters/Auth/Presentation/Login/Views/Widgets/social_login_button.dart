import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_colors.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.title,
      required this.images,
      required this.onPressed});
  final String title;
  final String images;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(6, 6),
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(340, 56),
          // Or Use SizedBox(Width:double.infinity/Height:56)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              width: 1,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(images),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold16.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
