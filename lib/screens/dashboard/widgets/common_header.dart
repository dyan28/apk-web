import 'package:flutter/material.dart';
import 'package:students/common/core/routes.dart';
import 'package:students/components/common_hoover_button.dart';
import 'package:students/components/common_navigator.dart';
import 'package:students/generated/assets.gen.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            Assets.images.bannerImage.path,
          ),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            child: CommonHooverButton(
              hooverColor: Colors.transparent,
              child: GestureDetector(
                onTap: () {
                  CommonNavigator.go(context,
                      routeName: Routes.dashboardScreen);
                },
                child: Image.asset(
                  Assets.images.spaLogoTransparent.path,
                  color: Colors.white,
                  height: 150,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
