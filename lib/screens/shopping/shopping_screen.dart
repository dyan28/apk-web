import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/components/common_scaffold.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/utils/app_constant.dart';

class ShoppingScreen extends ConsumerStatefulWidget {
  const ShoppingScreen({super.key});

  @override
  ConsumerState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends ConsumerState<ShoppingScreen> {
  final list = [
    ...AppConstants.dummyShoppingItemModel,
    ...AppConstants.dummyShoppingItemModel,
    ...AppConstants.dummyShoppingItemModel,
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            L10n.of(context).Shopping,
            style: AppTextStyle.superLarge,
          ),
          GridView.builder(
              itemCount: list.length,
              padding: const EdgeInsets.only(top: 32),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (ctx, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: list.elementAt(index).image ?? '',
                      fit: BoxFit.cover,
                    ),
                    Text(
                      list.elementAt(index).title ?? '',
                      style: AppTextStyle.medium,
                    ),
                    Text(
                      NumberFormat.simpleCurrency()
                          .format(list.elementAt(index).price),
                      style: AppTextStyle.large
                          .copyWith(fontWeight: FontWeight.bold),
                    )
                  ],
                );
              }),
        ],
      ),
      haveReverseButton: true,
    );
  }
}
