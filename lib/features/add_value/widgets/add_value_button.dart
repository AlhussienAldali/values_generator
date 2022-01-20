import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:values_generator/core/ui_constrains/app_colors.dart';
import 'package:values_generator/core/ui_constrains/themes/app_theme.dart';

class AddValueButton extends StatelessWidget {
  final String text;

  final VoidCallback onPressed;
  final bool? cancelButton;

  AddValueButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.cancelButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextButton(
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                  const BorderSide(color: AppColors.primary)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
            ),
            child: Text(
              text,
              style: context.bodyText2Style(),
            ),
            onPressed: onPressed));
  }
}
