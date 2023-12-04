import 'package:flutter/material.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/screens/dashboard/widgets/logo_view.dart';
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
    final introTitle = Text(
      L10n.of(context).banner_title,
      style: AppTextStyle.extraLargeLight
          .copyWith(fontSize: isSmallLayout(context) ? 28 : 32),
      textAlign: TextAlign.center,
    );

    final introContent = Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Text(
          L10n.of(context).banner_content,
          style: isSmallLayout(context)
              ? AppTextStyle.regularLight
              : AppTextStyle.mediumLight,
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.images.bannerImage.path,
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height *
          (isSmallLayout(context) ? 0.3 : 0.6),
      child: isSmallLayout(context)
          ? _smallLayout(context, introTitle, introContent)
          : _bigLayout(introTitle, introContent),
    );
  }

  Widget _smallLayout(
      BuildContext context, Widget introTitle, Widget introContent) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
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
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: introTitle,
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: const FittedBox(child: LogoView()),
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        introContent
      ],
    );
  }

  Widget _bigLayout(Widget introTitle, Widget introContent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MenuBarWebView(
          aboutKey: aboutKey,
          serviceKey: serviceKey,
          scrollController: scrollController,
          contactKey: contactKey,
        ),
        Expanded(
            child: Column(
          children: [introTitle, const SizedBox(height: 30), introContent],
        )),
      ],
    );
  }
}
