import 'package:flutter/material.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/utils/app_colors.dart';

class ShowDialogBtn extends StatelessWidget {
  const ShowDialogBtn({
    super.key,
    this.title = '',
    this.onTap,
    this.selectedValue = '',
  });

  final String title;
  final String selectedValue;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Text(
            title,
            style: AppTextStyle.medium,
          ),
          const SizedBox(height: 10),
        ],
        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            height: 42,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.greyCACACA,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Text(
                      selectedValue,
                      style: AppTextStyle.medium,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 20,
                  color: AppColors.black1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
