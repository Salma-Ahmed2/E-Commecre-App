import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_colors.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';

class CustomTextFormFaild extends StatelessWidget {
  const CustomTextFormFaild({
    super.key,
    required this.hitText,
    required this.textInputAction,
    this.suffixIcon,
    required this.keyboardType,
    this.onSaved,
    this.obscureText = false,
    required this.backgroundColor,
  });

  final String hitText;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.3),
            blurRadius: 2,
            offset: const Offset(6, 6),
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
        textInputAction: textInputAction,
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,
          suffixIcon: suffixIcon,
          hintText: hitText,
          hintStyle: TextStyles.regular17.copyWith(color: Colors.white),
          labelStyle: TextStyles.regular17.copyWith(color: Colors.white),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(),
    );
  }
}
