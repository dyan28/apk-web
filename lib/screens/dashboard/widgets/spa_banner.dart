import 'package:flutter/material.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/screens/dashboard/widgets/menu_bar_view.dart';
import 'package:students/utils/utils.dart';

class SpaBannerWidget extends StatelessWidget with Utils {
  const SpaBannerWidget({
    super.key,
    required this.scrollController,
    required this.serviceKey,
    required this.aboutKey,
    required this.contactKey,
  });

  final ScrollController scrollController;
  final GlobalKey serviceKey;
  final GlobalKey aboutKey;
  final GlobalKey contactKey;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.images.bannerImage.path,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
          fit: BoxFit.cover,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 120),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSmallLayout(context)
                  // TODO(linhlc): change layout case small size likes browser on mobile
                  ? const SizedBox()
                  : MenuBarWebView(
                      aboutKey: aboutKey,
                      serviceKey: serviceKey,
                      scrollController: scrollController,
                      contactKey: contactKey,
                    ),
              const SizedBox(height: 40),
              isSmallLayout(context)
                  ? const SizedBox()
                  : Expanded(
                      child: Column(
                        children: [
                          Text(
                            L10n.of(context).banner_title,
                            style: AppTextStyle.extraLargeLight,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 34),
                          Expanded(
                            child: Text(
                              L10n.of(context).banner_content,
                              style: AppTextStyle.mediumLight,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        isSmallLayout(context)
            ? Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}
