import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/components/common_drawer.dart';
import 'package:students/components/reverse_button.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/screens/dashboard/widgets/about_us_widget.dart';
import 'package:students/screens/dashboard/widgets/contact_info_widget.dart';
import 'package:students/screens/dashboard/widgets/contact_map_view.dart';
import 'package:students/screens/dashboard/widgets/open_hour_widget.dart';
import 'package:students/screens/dashboard/widgets/our_service_widget.dart';
import 'package:students/screens/dashboard/widgets/spa_banner.dart';
import 'package:students/utils/utils.dart';

class DashBoardArg {
  final int? index;

  DashBoardArg({this.index});
}

class DashBoardScreen extends ConsumerStatefulWidget {
  final int? index;
  const DashBoardScreen({super.key, this.index});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen>
    with TickerProviderStateMixin, Utils, WidgetsBindingObserver {
  late ScrollController _scrollController;
  var serviceKey = GlobalKey();
  var aboutKey = GlobalKey();
  var contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: isSmallLayout(context)
          ? CommonDrawer(
              aboutKey: aboutKey,
              contactKey: contactKey,
              serviceKey: serviceKey,
            )
          : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SpaBannerWidget(
              scrollController: _scrollController,
              aboutKey: aboutKey,
              contactKey: contactKey,
              serviceKey: serviceKey,
            ),
            OurServiceWidget(
              serviceKey: serviceKey,
            ),
            const OpenHourWidget(),
            AboutUsWidget(
              aboutKey: aboutKey,
            ),
            Padding(
              padding: paddingVertical(context),
              child: Text(
                L10n.of(context).Contact,
                style: AppTextStyle.extraLarge,
              ),
            ),
            const ContactMapView(),
            ContactInfoWidget(
              contactKey: contactKey,
            ),
          ],
        ),
      ),
      floatingActionButton: const ReverseButton(),
    );
  }
}
