import 'package:flutter/material.dart';
import 'package:fruits_app/Core/Widgets/constant.dart';
import 'package:fruits_app/Core/Widgets/custom_app_bar.dart';
import 'package:fruits_app/Core/Widgets/custom_button.dart';
import 'package:fruits_app/Core/utils/app_images.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';
import 'package:fruits_app/Feauters/AuthVacation/Presentation/Views/Widgets/custom_or_divider.dart';
import 'package:fruits_app/Feauters/AuthVacation/Presentation/Views/Widgets/custom_text_form_failed.dart';
import 'package:fruits_app/Feauters/AuthVacation/Presentation/Views/Widgets/custom_text_dont_have_account.dart';
import 'package:fruits_app/Feauters/AuthVacation/Presentation/Views/Widgets/forget_password.dart';
import 'package:svg_flutter/svg.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          // Stack(
          //   children: [
          //     const BackGroundImageLogin(loginImage: Assets.loginColor),
          Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
        ),
        child: Column(
          children: [
            const CustomAppBarLogin(
              titleAppBar: 'تسجيل الدخول',
            ),
            const SizedBox(
              height: 24,
            ),
            const CustomTextFormFaild(
              hitText: '   البريد الالكتروني',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 28,
            ),
            const CustomTextFormFaild(
              hitText: '    كلمة المرور ',
              textInputAction: TextInputAction.done,
              suffixIcon: Icon(
                Icons.remove_red_eye_rounded,
                color: Color.fromARGB(255, 125, 132, 133),
              ),
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(
              height: 20,
            ),
            const ForgetPassword(),
            const SizedBox(
              height: 33,
            ),
            CustomButton(
              onPressed: () {},
              text: 'تسجيل دخول',
            ),
            const SizedBox(
              height: 33,
            ),
            const CustomTextDontHaveAccount(),
            const SizedBox(
              height: 41,
            ),
            const OrDivider(),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              onPressed: () {},
              title: 'تسجيل بواسطة جوجل',
              images: Assets.imagesGoogleIcons,
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              onPressed: () {},
              title: 'تسجيل بواسطة أبل',
              images: Assets.imagesAppleIcons,
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              onPressed: () {},
              title: 'تسجيل بواسطة فيسبوك',
              images: Assets.imagesFacebookIcons,
            ),
          ],
        ),
      ),
    );
  }
}

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
            color: Colors.black.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(
              6,
              6,
            ),
          ),
        ],
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(340, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              width: 3,
              color: Color(0xFFDCDEDE),
            ),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          leading: SvgPicture.asset(images),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
