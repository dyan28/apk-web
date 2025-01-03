import 'package:flutter/material.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/generated/l10n.dart';
import 'package:apkfree/utils/app_colors.dart';

class ReverseButton extends StatelessWidget {
  const ReverseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.backGround2,
      ),
      child: Text(
        L10n.of(context).reverse,
        style: AppTextStyle.medium.copyWith(color: Colors.black),
      ),
    );
  }
}
