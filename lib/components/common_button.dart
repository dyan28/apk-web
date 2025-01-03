import 'package:flutter/material.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/utils/app_colors.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.label,
    this.onTap,
    this.height = 44,
    this.width,
    this.bgColor = AppColors.primaryBtn,
    this.titleTextStyle,
  });
  final String? label;
  final VoidCallback? onTap;
  final Color bgColor;
  final double height;
  final double? width;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 20,
            ),
            backgroundColor: bgColor,
          ),
          onPressed: onTap,
          child: Text(
            label ?? '',
            style: titleTextStyle ??
                AppTextStyle.medium.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
