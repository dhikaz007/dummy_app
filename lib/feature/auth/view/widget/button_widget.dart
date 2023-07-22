import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text.dart';



class ButtonWidget extends StatelessWidget {
  final double widthSize;
  final String title;
  final Color? backgroundColor;
  final Color sideColor;
  final double widthSideColor;
  final double? elevation;
  final List<Color> gradientColor;
  final VoidCallback? onPressed;
  const ButtonWidget({
    super.key,
    required this.widthSize,
    required this.title,
    this.backgroundColor,
    this.sideColor = Colors.transparent,
    this.widthSideColor = 1.0,
    this.elevation,
    required this.gradientColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(backgroundColor),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.zero,
        ),
        side: MaterialStatePropertyAll(
          BorderSide(
            color: sideColor,
            width: widthSideColor,
          ),
        ),
        elevation: MaterialStatePropertyAll(elevation),
      ),
      onPressed: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: gradientColor,
          ),
        ),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: widthSize,
            minHeight: 50,
          ),
          alignment: Alignment.center,
          child: AppText(
            context: context,
            text: title,
            style: AppTextStyle.title1,
            fontWeight: CustomFontWeight.bold,
            color: AppColors.primaryWhite,
          ),
        ),
      ),
    );
  }
}
