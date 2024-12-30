import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/components/common_drawer.dart';
import 'package:students/components/reverse_button.dart';
import 'package:students/components/top_game_circle.dart';
import 'package:students/generated/l10n.dart';

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
    with SingleTickerProviderStateMixin, Utils, WidgetsBindingObserver {
  late ScrollController _scrollController;
  late TabController tabController;
  var serviceKey = GlobalKey();
  var aboutKey = GlobalKey();
  var contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
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
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.successColor,
        leading: Container(
          width: 200,
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "APK",
            style: AppTextStyle.large.copyWith(
              fontSize: 50,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        leadingWidth: 400,
        title: SizedBox(
          width: 300,
          height: 100,
          child: TabBar(
            controller: tabController,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "Home",
                icon: Icon(
                  Icons.home,
                  color: Colors.indigo.shade500,
                ),
              ),
              Tab(
                text: "Games",
                icon: Icon(
                  Icons.gamepad,
                  color: Colors.indigo.shade500,
                ),
              ),
              Tab(
                text: "Apps",
                icon: Icon(
                  Icons.apps,
                  color: Colors.indigo.shade500,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Icon(
              Icons.search,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    width: 2,
                    color: Colors.grey,
                  ),
                ),
                child: Row(
                  children: [Icon(Icons.search), Text("Search...")],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Divider(
                  color: Colors.red,
                  thickness: 2,
                  height: 3,
                ),
                Text(
                  'Popular APK on ApkFyp',
                  style: AppTextStyle.large,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
              ],
            ),
            SizedBox(
              height: 150,
            ),
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopGameCircle(),
                  SizedBox(width: 80),
                  Transform.translate(
                    offset: Offset(0, -80),
                    child: TopGameCircle(),
                  ),
                  SizedBox(width: 80),
                  TopGameCircle()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
