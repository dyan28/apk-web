import 'package:flutter/material.dart';
import 'package:students/common/core/routes.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/components/common_button.dart';
import 'package:students/components/common_navigator.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/utils/app_colors.dart';

class ReverseButton extends StatelessWidget {
  const ReverseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonButton(
      bgColor: AppColors.backGround2,
      label: L10n.of(context).reverse,
      width: 150,
        titleTextStyle: AppTextStyle.medium.copyWith(color: Colors.black),
      onTap: () {
        CommonNavigator.go(context, routeName: Routes.bookingScreen);
      },
    );
  }
}
