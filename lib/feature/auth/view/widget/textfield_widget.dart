import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text.dart';

class TextFieldWigdet extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool? obscureText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  const TextFieldWigdet({
    super.key,
    required this.title,
    required this.icon,
    this.obscureText,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      height: 60,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.gradientWhiteOne,
            AppColors.gradientWhiteTwo,
          ],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText ?? false,
        style: const TextStyle(
          fontSize: 18,
          color: AppColors.primaryBlue,
          fontWeight: FontWeight.normal,
        ),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          label: AppText(
            context: context,
            text: title,
            style: AppTextStyle.title2,
            fontWeight: CustomFontWeight.medium,
            color: AppColors.primaryBlue,
          ),
          prefixIcon: Icon(
            icon,
            size: 28,
            color: AppColors.primaryBlue,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
