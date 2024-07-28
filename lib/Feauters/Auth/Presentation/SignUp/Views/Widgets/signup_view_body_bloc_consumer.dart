import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/Helper/build_error_bar.dart';
import 'package:fruits_app/Core/Helper/build_success_bar.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/SignUp/Views/Widgets/sign_up_view_body.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          buildSuccessBar(context, state.message);
        }
        if (state is SignupFailuer) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
