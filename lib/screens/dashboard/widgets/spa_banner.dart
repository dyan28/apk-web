import 'package:flutter/material.dart';
import 'package:students/common/core/routes.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/components/common_navigator.dart';
import 'package:students/components/reverse_button.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/screens/dashboard/widgets/spa_banner_menu_item.dart';

class SpaBannerWidget extends StatelessWidget {
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
              Expanded(
                child: Row(
                  children: [
                    SpaBannerMenuItem(
                      text: L10n.of(context).Home,
                      onTap: () {
                        CommonNavigator.go(context,
                            routeName: Routes.dashboardScreen);
                      },
                    ),
                    SpaBannerMenuItem(
                        text: L10n.of(context).Services,
                        onTap: () {
                          ensureVisible(serviceKey.currentContext);
                        }),
                    SpaBannerMenuItem(
                        text: L10n.of(context).blog,
                        onTap: () {
                          CommonNavigator.go(context,
                              routeName: Routes.blogScreen);
                        }),
                    Expanded(
                      child: Image.asset(
                        Assets.images.spaLogoTransparent.path,
                        color: Colors.white,
                      ),
                    ),
                    SpaBannerMenuItem(
                        text: L10n.of(context).About,
                        onTap: () {
                          ensureVisible(aboutKey.currentContext);
                        }),
                    SpaBannerMenuItem(
                        text: L10n.of(context).Contact,
                        onTap: () {
                          ensureVisible(contactKey.currentContext);
                        }),
                    SpaBannerMenuItem(
                        text: L10n.of(context).Shopping,
                        onTap: () {
                          CommonNavigator.go(context,
                              routeName: Routes.shoppingScreen);
                        }),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          L10n.of(context).banner_title,
                          style: AppTextStyle.extraLargeLight,
                          textAlign: TextAlign.center,
                        ),
                        const ReverseButton(),
                      ],
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
      ],
    );
  }

  void ensureVisible(BuildContext? context) {
    if (context == null) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
