import 'package:flutter/material.dart';
import 'package:fruits_app/Core/Widgets/custom_app_bar.dart';
import 'Widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  static const routeName = 'LoginView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(
        context,
        titleAppBar: 'تسجيل الدخول',
      ),
      body: LoginViewBody(),
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
