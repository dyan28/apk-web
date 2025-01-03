import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/utils/app_constant.dart';
import 'package:apkfree/utils/date_time_util.dart';

class BlogListWidget extends StatelessWidget {
  const BlogListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final blogList = AppConstants.dummyBlogModel;

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 32),
      itemBuilder: (ctx, index) {
        final item = blogList.elementAt(index);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: item.image ?? '',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title ?? '',
                    style: AppTextStyle.large,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    DateTimeUtil.formatFullDate(
                        item.createdDate ?? DateTime.now()),
                    style: AppTextStyle.medium,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    item.shortDescription ?? '',
                    style: AppTextStyle.medium,
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (ctx, index) => const SizedBox(height: 20),
      itemCount: blogList.length,
    );
  }
}
