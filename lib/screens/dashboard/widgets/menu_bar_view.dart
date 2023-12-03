import 'package:flutter/material.dart';
import 'package:students/common/core/routes.dart';
import 'package:students/components/common_navigator.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/screens/dashboard/widgets/logo_view.dart';
import 'package:students/screens/dashboard/widgets/spa_banner_menu_item.dart';

class MenuBarWebView extends StatelessWidget {
  const MenuBarWebView({
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SpaBannerMenuItem(
            text: L10n.of(context).Home,
            onTap: () {
              CommonNavigator.go(context, routeName: Routes.dashboardScreen);
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
                CommonNavigator.go(context, routeName: Routes.blogScreen);
              }),
          const LogoView(),
          SpaBannerMenuItem(
              text: L10n.of(context).Shopping,
              onTap: () {
                CommonNavigator.go(context, routeName: Routes.shoppingScreen);
              }),
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
        ],
      ),
    );
  }
}
