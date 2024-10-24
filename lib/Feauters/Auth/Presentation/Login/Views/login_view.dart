import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/Core/Services/get_it_services.dart';
import 'package:fruits_app/Core/Widgets/custom_app_bar.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/Login/Views/Widgets/login_view_body_bloc_consumer.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/cubit/login_cubit/login_cubit.dart';
import '../../../Domin/Repos/auth_repo.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  static const routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<AuthRepo>(),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: buildAppBar(
          context,
          titleAppBar: 'تسجيل الدخول',
        ),
        body: const LoginViewBodyBlocConsumer(),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:fruits_app/Core/Widgets/custom_app_bar.dart';
// import 'package:fruits_app/Core/Widgets/custom_back_ground_image_login.dart';
// import 'package:fruits_app/Core/utils/app_images.dart';
// import 'Widgets/login_view_body.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({
//     super.key,
//   });

//   static const routeName = 'LoginView';
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       resizeToAvoidBottomInset: false,
//       // appBar: buildAppBar(
//       //   context,
//       //   titleAppBar: 'تسجيل الدخول',
//       // ),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             BackGroundImageLogin(loginImage: Assets.imagesColorLogin),
//             Column(children: [
//               CustomAppBarLogin(titleAppBar: 'تسجيل دخول'),
//               LoginViewBody()
//             ]),
//           ],
//         ),
//       ),
//     );
//   }
// }
