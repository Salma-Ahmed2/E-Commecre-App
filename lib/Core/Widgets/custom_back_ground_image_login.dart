import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BackGroundImageLogin extends StatelessWidget {
  const BackGroundImageLogin({super.key, required this.loginImage});

  final String loginImage;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 1,
        minWidth: MediaQuery.of(context).size.width * 1,
      ),
      child: SvgPicture.asset(
        loginImage,
        fit: BoxFit.fill,
      ),
    );
  }
}

  // return Positioned.fill(
  //     child: SvgPicture.asset(
  //       loginImage,
  //       fit: BoxFit.cover,
  //     ),
  //   );