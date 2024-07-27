import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/Widgets/constant.dart';
import 'package:fruits_app/Core/Widgets/custom_button.dart';
import 'package:fruits_app/Core/Widgets/custom_text_account.dart';
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

  late String email, password, userName;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:
            //  Stack(
            //   children: [
            //     const BackGroundImageLogin(loginImage: Assets.imagesColorLogin),
            // Column(
            //   children: [
            //     const CustomAppBarLogin(
            //       titleAppBar: 'حساب جديد',
            //     ),
            //     const SizedBox(
            //       height: 24,
            //     ),
            Padding(
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
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormFaild(
              onSaved: (value) {
                password = value!;
              },
              hitText: 'كلمة المرور',
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: const Icon(
                Icons.remove_red_eye_rounded,
                color: Color.fromARGB(255, 125, 132, 133),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const SignUpTermsAndCondition(),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SignupCubit>().createUserWithEmailAndPassword(
                      email, password, userName);
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
    )
        // ],
        );
    // ],
    // ),
    // );
  }
}
