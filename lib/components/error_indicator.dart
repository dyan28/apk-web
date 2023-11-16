import 'package:flutter/material.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/utils/app_colors.dart';

class CommonErrorIndicator extends StatelessWidget {
  const CommonErrorIndicator({
    super.key,
    this.message,
    this.onTapRetry,
  });
  final String? message;
  final VoidCallback? onTapRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message ?? 'Errors',
            style: AppTextStyle.regular,
          ),
          onTapRetry != null
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple2E1470,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  onPressed: onTapRetry,
                  child: Text(
                    'Retry',
                    style: AppTextStyle.regular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
