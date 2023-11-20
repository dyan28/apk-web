import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/screens/dashboard/widgets/about_us_widget.dart';
import 'package:students/screens/dashboard/widgets/contact_info_widget.dart';
import 'package:students/screens/dashboard/widgets/open_hour_widget.dart';
import 'package:students/screens/dashboard/widgets/our_service_widget.dart';
import 'package:students/screens/dashboard/widgets/spa_banner.dart';
import 'package:students/utils/app_colors.dart';
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
      backgroundColor: AppColors.backGround,
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
            AboutUsWidget(
              aboutKey: aboutKey,
            ),
            const OpenHourWidget(),
            ContactInfoWidget(
              contactKey: contactKey,
            ),
          ],
        ),
      ),
    );
  }
}
