import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/utils/app_colors.dart';

class CommonAppbar extends PreferredSize {
  CommonAppbar({
    String? title,
    String? subtitle,
    super.key,
    bool centerTitle = true,
    void Function()? onTapBack,
    Widget? leadingWidget,
    Widget? titleWidget,
    List<Widget>? actions,
    double? elevation,
    PreferredSizeWidget? bottom,
    Color? color,
    Color? titleColor,
  }) : super(
          child: AppBar(
            bottom: bottom,
            centerTitle: centerTitle,
            elevation: elevation ?? 0,
            actions: actions != null ? [...actions] : null,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: color ?? AppColors.backGround,
            // TODO(Dyan): handle text style
            title: titleWidget ??
                Column(
                  children: [
                    Text(
                      title ?? '',
                      style: AppTextStyle.extraLarge,
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle,
                      ),
                  ],
                ),
            leading: leadingWidget ?? const SizedBox(),
          ),
          preferredSize: bottom != null
              ? const Size.fromHeight(160)
              : const Size.fromHeight(100),
        );
}
