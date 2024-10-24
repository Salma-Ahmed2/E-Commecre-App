import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/Helper/build_error_bar.dart';
import 'package:fruits_app/Core/Helper/build_success_bar.dart';
import 'package:fruits_app/Core/Widgets/custom_progress_hud.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/Login/Views/Widgets/login_view_body.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/cubit/login_cubit/login_cubit.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          buildSuccessBar(context, state.message);
        }
        if (state is LoginFailuer) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            inAsyncCall: state is LoginLoading ? true : false,
            child: const LoginViewBody());
      },
    );
  }
}
