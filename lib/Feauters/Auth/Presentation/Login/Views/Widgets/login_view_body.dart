import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/Widgets/constant.dart';
import 'package:fruits_app/Core/Widgets/custom_button.dart';
import 'package:fruits_app/Core/Widgets/password_failed.dart';
import 'package:fruits_app/Core/utils/app_images.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/Login/Views/Widgets/custom_or_divider.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/Login/Views/Widgets/custom_text_form_failed.dart';
import 'package:fruits_app/Core/Widgets/custom_text_account.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/Login/Views/Widgets/forget_password.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/Login/Views/Widgets/social_login_button.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/SignUp/Views/sign_up_view.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/cubit/login_cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          //
          // Stack(
          //   children: [
          //     const BackGroundImageLogin(loginImage: Assets.imagesColorLogin),
          Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
        ),
        //       child: Column(
        //         children: [
        //           const CustomAppBarLogin(
        //             titleAppBar: 'تسجيل الدخول',
        //           ),
        //           const SizedBox(
        //             height: 24,
        //           ),
        //           SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormFaild(
                onSaved: (value) {
                  email = value!;
                },
                hitText: '   البريد الالكتروني',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 28,
              ),
              PasswordFailed(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              const ForgetPassword(),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().logIn(email, password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'تسجيل دخول',
              ),
              const SizedBox(
                height: 33,
              ),
              CustomTextAccount(
                titleHaveAccountOrNot: 'لا تمتلك حساب ؟',
                titleNewAccount: ' قم بإنشاء حساب  ',
                onTap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
              ),
              const SizedBox(
                height: 41,
              ),
              const OrDivider(),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                onPressed: () {
                  context.read<LoginCubit>().logInWithGoogle();
                },
                title: 'تسجيل بواسطة جوجل',
                images: Assets.imagesGoogleIcons,
              ),
              const SizedBox(
                height: 18,
              ),
              SocialLoginButton(
                onPressed: () {},
                title: 'تسجيل بواسطة أبل',
                images: Assets.imagesAppleIcons,
              ),
              const SizedBox(
                height: 18,
              ),
              SocialLoginButton(
                onPressed: () {
                  context.read<LoginCubit>().logInWithFacebook();
                },
                title: 'تسجيل بواسطة فيسبوك',
                images: Assets.imagesFacebookIcons,
              ),
            ],
          ),
        ),
      ),
    );
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
