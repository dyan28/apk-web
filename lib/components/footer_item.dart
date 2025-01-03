import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apkfree/common/core/constants.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/utils/app_colors.dart';

class FooterItem extends StatelessWidget {
  const FooterItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            "APKFYP - Free APK \nDownload for Android, Games and Premium Apps",
            style: AppTextStyle.large.copyWith(
              color: Colors.black,
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Constants.welcome,
            style: AppTextStyle.medium.copyWith(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 24),
        Text(
          "What is APKFYP?",
          style: AppTextStyle.large.copyWith(
            color: Colors.black,
            fontSize: 28,
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Constants.whatIs,
            style: AppTextStyle.medium.copyWith(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
        SizedBox(height: 24),
        Container(
          height: 300,
          color: AppColors.contentColor,
        )
      ],
    );
  }
}
