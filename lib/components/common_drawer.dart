import 'package:flutter/material.dart';
import 'package:students/common/core/routes.dart';
import 'package:students/components/common_navigator.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/generated/l10n.dart';

class CommonDrawer extends StatelessWidget {
  const CommonDrawer({
    super.key,
    this.serviceKey,
    this.aboutKey,
    this.contactKey,
  });

  final GlobalKey? serviceKey;
  final GlobalKey? aboutKey;
  final GlobalKey? contactKey;

  void ensureVisible(BuildContext? context) {
    if (context == null) {
      return;
    }
    Scaffold.of(context).closeDrawer();
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Image.asset(
            Assets.images.spaLogoTransparent.path,
            height: 70,
          ),
          ListTile(
            title: Text(L10n.of(context).Home),
            onTap: () {
              Scaffold.of(context).closeDrawer();
              CommonNavigator.go(context, routeName: Routes.dashboardScreen);
            },
          ),
          ListTile(
            title: Text(L10n.of(context).Services),
            onTap: () {
              ensureVisible(serviceKey?.currentContext);
            },
          ),
          ListTile(
            title: Text(L10n.of(context).blog),
            onTap: () {
              CommonNavigator.go(context, routeName: Routes.blogScreen);
            },
          ),
          ListTile(
            title: Text(L10n.of(context).About),
            onTap: () {
              ensureVisible(aboutKey?.currentContext);
            },
          ),
          ListTile(
            title: Text(L10n.of(context).Contact),
            onTap: () {
              ensureVisible(contactKey?.currentContext);
            },
          ),
          ListTile(
            title: Text(L10n.of(context).Shopping),
            onTap: () {
              CommonNavigator.go(context, routeName: Routes.shoppingScreen);
            },
          ),
        ],
      ),
    );
  }
}
