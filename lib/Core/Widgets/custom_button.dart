import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 54,
          child: GestureDetector(
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 23, 36, 126),
                    Color(0xff6e6fff),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 8.0,
                    offset: const Offset(7, 7),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(text,
                  style: TextStyles.medium20.copyWith(
                    color: Colors.white,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
