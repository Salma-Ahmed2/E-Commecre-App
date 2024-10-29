import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_colors.dart';
import 'package:fruits_app/Feauters/Auth/Presentation/Login/Views/Widgets/custom_text_form_failed.dart';

class PasswordFailed extends StatefulWidget {
  const PasswordFailed({
    super.key,
    this.onSaved,
  });

  final void Function(String?)? onSaved;

  @override
  State<PasswordFailed> createState() => _PasswordFailedState();
}

class _PasswordFailedState extends State<PasswordFailed> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormFaild(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hitText: 'كلمة المرور',
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_off,
                color: Colors.white,
              )
            : const Icon(
                Icons.remove_red_eye_rounded,
                color: Colors.white,
              ),
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
