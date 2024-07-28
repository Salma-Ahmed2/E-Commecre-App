import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';

class CustomTextFormFaild extends StatelessWidget {
  const CustomTextFormFaild(
      {super.key,
      required this.hitText,
      required this.textInputAction,
      this.suffixIcon,
      required this.keyboardType,
      this.onSaved,
      this.obscureText = false});
  final String hitText;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(
              7,
              7,
            ),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
        keyboardType: keyboardType,
        cursorColor: const Color.fromARGB(255, 125, 132, 133),
        style: TextStyles.semiBold18.copyWith(
          color: const Color.fromARGB(255, 125, 132, 133),
        ),
        textInputAction: textInputAction,
        decoration: InputDecoration(
          filled: true,
          // fillColor: Color.fromARGB(255, 217, 228, 187).withOpacity(.4),
          suffixIcon: suffixIcon,
          hintText: hitText,
          hintStyle: TextStyles.regular16.copyWith(
            color: const Color.fromARGB(255, 125, 132, 133),
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(
        color: Color(0xff969168),
        width: 0.3,
      ),
    );
  }
}
