import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';

void buildSuccessBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: Colors.blue,
      content: Text(
        message,
        style: TextStyles.regular16,
      ),
    ),
  );
}
