import 'package:flutter/material.dart';
import 'package:fruits_app/Core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 2,
            color: Color(0xffDDDFDF),
          ),
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          textAlign: TextAlign.center,
          'أو',
          style: TextStyles.semiBold16,
        ),
        SizedBox(
          width: 18,
        ),
        Expanded(
          child: Divider(
            thickness: 2,
            color: Color(0xffDDDFDF),
          ),
        ),
      ],
    );
  }
}
