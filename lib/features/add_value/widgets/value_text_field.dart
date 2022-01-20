import 'package:flutter/material.dart';
import 'package:values_generator/core/ui_constrains/app_colors.dart';
import 'package:values_generator/core/ui_constrains/themes/app_theme.dart';

class ValueTextField extends StatefulWidget {
  final double width;
  final double height;
  final TextEditingController textEditingController;

  const ValueTextField(
      {Key? key,
      this.width = 250,
      this.height = 150,
      required this.textEditingController})
      : super(key: key);

  @override
  _ValueTextFieldState createState() => _ValueTextFieldState();
}

class _ValueTextFieldState extends State<ValueTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: TextField(
          maxLines: 3,
          maxLength: 60,
          cursorColor: AppColors.primary,
          controller: widget.textEditingController,
          style: context.bodyText2Style()!.apply(fontFamily:"MochiyPopPOne" ),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintStyle: const TextStyle(color: AppColors.primary),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(5.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(5.0),
              )),
        ));
  }
}
//0xFF248990
