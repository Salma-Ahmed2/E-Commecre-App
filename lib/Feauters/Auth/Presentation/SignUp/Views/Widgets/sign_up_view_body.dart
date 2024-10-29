import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/Helper/build_error_bar.dart';
import 'package:fruits_app/Core/Widgets/constant.dart';
import 'package:fruits_app/Core/Widgets/custom_button.dart';
import 'package:fruits_app/Core/Widgets/custom_text_account.dart';
import 'package:fruits_app/Core/Widgets/password_failed.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/Login/Views/Widgets/custom_text_form_failed.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/SignUp/Views/Widgets/sign_up_terms_and_condition.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/cubit/signup_cubit/signup_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, userName, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
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
                  userName = value!;
                },
                hitText: 'الاسم كامل',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                backgroundColor: const Color(0xff0f1b66),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormFaild(
                onSaved: (value) {
                  email = value!;
                },
                hitText: 'البريد الإلكتروني',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                backgroundColor: const Color(0xff0f1b66),
              ),
              const SizedBox(
                height: 20,
              ),
              PasswordFailed(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 18,
              ),
              SignUpTermsAndCondition(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context.read<SignupCubit>().signUp(
                            email,
                            password,
                            userName,
                          );
                    } else {
                      buildErrorBar(
                          context, 'يجب عليك الموافقة على الشروط والإحكام');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(
                height: 26,
              ),
              CustomTextAccount(
                titleHaveAccountOrNot: 'تمتلك حساب بالفعل ؟',
                titleNewAccount: '  تسجيل دخول  ',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
