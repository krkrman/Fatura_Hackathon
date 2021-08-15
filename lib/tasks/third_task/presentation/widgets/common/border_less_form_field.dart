import 'package:flutter/material.dart';

class BorderLessFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isPassword;
  final bool isClickable;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final FormFieldValidator<String>? validate;
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final GestureTapCallback? onTap;
  final Color? backgroundColor, textColor, suffixIconColor, prefixIconColor;
  final double height;
  final double fontSize;
  final double radius;

  const BorderLessFormField({
    required this.controller,
    required this.textInputType,
    this.isPassword = false,
    this.onSubmit,
    this.onChange,
    required this.validate,
    required this.hint,
    this.height = 50,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.isClickable = true,
    this.fontSize = 16,
    this.onTap,
    this.radius = 4,
    this.backgroundColor,
    this.textColor,
    this.prefixIconColor,
    this.suffixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor ?? Colors.grey[300]),
      child: Row(
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                prefixIcon,
                color: prefixIconColor,
              ),
            ),
          Expanded(
            child: TextFormField(
              controller: controller,
              keyboardType: textInputType,
              obscureText: isPassword,
              enabled: isClickable,
              onFieldSubmitted: onSubmit,
              onChanged: onChange,
              onTap: onTap,
              validator: validate,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
          IconButton(
            onPressed: suffixPressed,
            icon: Icon(suffixIcon),
            color: suffixIconColor,
          )
        ],
      ),
    );
  }
}
