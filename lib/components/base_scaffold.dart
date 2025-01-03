import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apkfree/common/core/routes.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/components/common_navigator.dart';
import 'package:apkfree/screens/dashboard/dashboard_state_notifier.dart';
import 'package:apkfree/utils/app_colors.dart';
import 'package:apkfree/utils/utils.dart';

class BaseScaffold extends ConsumerStatefulWidget {
  const BaseScaffold({super.key, required this.child});
  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends ConsumerState<BaseScaffold>
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

  void _onChangeTap(index) {
    switch (index) {
      case 0:
        CommonNavigator.go(context, routeName: '/');
        break;
      case 1:
        CommonNavigator.go(context, routeName: Routes.games);
        break;
      case 2:
        CommonNavigator.go(context, routeName: Routes.apps);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(dashboardNotifierProvider);
    final notifier = ref.read(dashboardNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: AppColors.materialColor,
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
            onTap: (index) {
              notifier.updateViewAndDashboardIndex(
                  tabController: tabController, indexTab: index);
              _onChangeTap(index);
            },
            labelColor: Colors.white,
            labelStyle: AppTextStyle.medium,
            tabs: [
              Tab(
                text: "Home",
                icon: Icon(Icons.home,
                    color: state.indexTab == 0
                        ? Colors.white
                        : Colors.indigo.shade500),
              ),
              Tab(
                text: "Games",
                icon: Icon(Icons.gamepad,
                    color: state.indexTab == 1
                        ? Colors.white
                        : Colors.indigo.shade500),
              ),
              Tab(
                text: "Apps",
                icon: Icon(Icons.apps,
                    color: state.indexTab == 2
                        ? Colors.white
                        : Colors.indigo.shade500),
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
      body: widget.child,
    );
  }
}
