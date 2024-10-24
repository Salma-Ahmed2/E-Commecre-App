import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/Services/get_it_services.dart';
import 'package:fruits_app/Core/Widgets/custom_app_bar.dart';
import 'package:fruits_app/Feauters/Auth/Domin/Repos/auth_repo.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/SignUp/Views/Widgets/signup_view_body_bloc_consumer.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/cubit/signup_cubit/signup_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'SignUp';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, titleAppBar: 'حساب جديد'),
        body: const SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
