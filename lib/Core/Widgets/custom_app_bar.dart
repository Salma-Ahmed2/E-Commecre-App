import 'package:flutter/material.dart';
import '../utils/app_text_styles.dart';

AppBar buildAppBar(context, {required String titleAppBar}) {
  return AppBar(
    leading: GestureDetector(
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: true,
    title: Text(
      titleAppBar,
      style: TextStyles.bold19,
      textAlign: TextAlign.center,
    ),
    // backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
// import 'package:flutter/material.dart';

// import '../utils/app_text_styles.dart';

// class CustomAppBarLogin extends StatelessWidget {
//   const CustomAppBarLogin({super.key, required this.titleAppBar});
//   final String titleAppBar;
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       leading: GestureDetector(
//         child: const Icon(Icons.arrow_back_ios_new),
//         onTap: () {
//           Navigator.of(context).pop();
//         },
//       ),
//       centerTitle: true,
//       title: Text(
//         titleAppBar,
//         style: TextStyles.bold19,
//         textAlign: TextAlign.center,
//       ),
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//     );
//   }
// }
