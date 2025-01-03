import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/utils/app_constant.dart';

class AboutUsListView extends StatefulWidget {
  const AboutUsListView({super.key});

  @override
  State<AboutUsListView> createState() => _AboutUsListViewState();
}

class _AboutUsListViewState extends State<AboutUsListView> {
  @override
  Widget build(BuildContext context) {
    const list = AppConstants.dummyAboutModel;

    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 64),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) {
          final item = list.elementAt(index);
          final title = item.title;

          return Column(
            children: [
              Text(
                title ?? '',
                style: AppTextStyle.largeItalic,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: title == null ? 0 : 32,
              ),
              index % 2 == 0
                  ? Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            item.text ?? '',
                            style: AppTextStyle.largeNormal,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 3,
                          child: CachedNetworkImage(
                            imageUrl: item.image ?? '',
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: CachedNetworkImage(
                            imageUrl: item.image ?? '',
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          flex: 3,
                          child: Text(
                            item.text ?? '',
                            style: AppTextStyle.largeNormal,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
            ],
          );
        },
        separatorBuilder: (ctx, index) => const SizedBox(
              height: 20,
            ),
        itemCount: list.length);
  }
}
