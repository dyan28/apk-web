import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:apkfree/components/app_text_style.dart';
import 'package:apkfree/components/base_scaffold.dart';
import 'package:apkfree/components/common_drawer.dart';
import 'package:apkfree/components/common_navigator.dart';
import 'package:apkfree/components/footer_item.dart';
import 'package:apkfree/components/game_item.dart';
import 'package:apkfree/components/reverse_button.dart';
import 'package:apkfree/components/top_game_circle.dart';
import 'package:apkfree/generated/l10n.dart';
import 'package:apkfree/screens/dashboard/dashboard_state_notifier.dart';

import 'package:apkfree/utils/app_colors.dart';
import 'package:apkfree/utils/utils.dart';

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
    final state = ref.watch(dashboardNotifierProvider);
    final notifier = ref.read(dashboardNotifierProvider.notifier);
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: AppColors.contentColor,
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                Text(
                  "Search...",
                  style: AppTextStyle.medium,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Divider(
                  thickness: 3,
                  color: AppColors.contentColor,
                )),
                SizedBox(width: 8),
                Text(
                  'Popular APK on ApkFyp',
                  style: AppTextStyle.large,
                ),
                SizedBox(width: 8),
                Expanded(
                    child: Divider(
                  thickness: 3,
                  color: AppColors.contentColor,
                )),
              ],
            ),
          ),
          SizedBox(
            height: 150,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopGameCircle(
                  topNumber: '2',
                  imageUrl: 'https://robohash.org/top/2',
                ),
                SizedBox(width: 80),
                Transform.translate(
                  offset: Offset(0, -80),
                  child: TopGameCircle(
                      topNumber: '1', imageUrl: 'https://robohash.org/top/1'),
                ),
                SizedBox(width: 80),
                TopGameCircle(
                    topNumber: '3', imageUrl: 'https://robohash.org/top/3')
              ],
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(20).copyWith(top: 50),
            crossAxisCount: 3,
            childAspectRatio: 5,
            shrinkWrap: true,

            // padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            children: List.generate(8, (index) {
              return GameItem(
                bgColor: true,
                showBorder: false,
                onTap: () {
                  CommonNavigator.go(context, routeName: 'title$index');
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Divider(
                  thickness: 3,
                  color: AppColors.contentColor,
                )),
                SizedBox(width: 8),
                Text(
                  'Latest APK on ApkFyp',
                  style: AppTextStyle.large,
                ),
                SizedBox(width: 8),
                Expanded(
                    child: Divider(
                  thickness: 3,
                  color: AppColors.contentColor,
                )),
              ],
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            crossAxisCount: 3,
            childAspectRatio: 5,
            shrinkWrap: true,

            // padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            children: List.generate(24, (index) {
              return GameItem(
                showBorder: true,
                onTap: () {},
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                if (index == 3) {
                  return Text('...');
                }
                return Container(
                  height: 30,
                  width: 30,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: index == 0 ? AppColors.contentColor : null,
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                      child: index == 5
                          ? Icon(Icons.arrow_forward_ios)
                          : Text(
                              index == 4 ? '23' : '${index + 1}',
                              style: AppTextStyle.medium,
                            )),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Update Games',
                  style: AppTextStyle.medium.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.materialColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: AppColors.materialColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'All Games',
                        style:
                            AppTextStyle.medium.copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 16,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24),
          GridView.count(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            crossAxisCount: 3,
            childAspectRatio: 5,
            shrinkWrap: true,

            // padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            children: List.generate(9, (index) {
              return GameItem(
                showBorder: true,
                onTap: () {},
              );
            }).toList(),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'New Update Apps',
                  style: AppTextStyle.medium.copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.materialColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: AppColors.materialColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'All Apps',
                        style:
                            AppTextStyle.medium.copyWith(color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 16,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24),
          GridView.count(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            crossAxisCount: 3,
            childAspectRatio: 5,
            shrinkWrap: true,

            // padding: const EdgeInsets.all(4.0),
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            children: List.generate(9, (index) {
              return GameItem(
                showBorder: true,
                onTap: () {},
              );
            }).toList(),
          ),
          SizedBox(height: 24),
          FooterItem()
        ],
      ),
    );
  }
}
     // body: SingleChildScrollView(
  //       controller: _scrollController,
  //       child: Column(
  //         children: [
  //           Container(
  //             height: 50,
  //             margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(16),
  //               border: Border.all(
  //                 width: 2,
  //                 color: AppColors.contentColor,
  //               ),
  //             ),
  //             child: Row(
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Icon(Icons.search),
  //                 ),
  //                 Text(
  //                   "Search...",
  //                   style: AppTextStyle.medium,
  //                 )
  //               ],
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 16),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Expanded(
  //                     child: Divider(
  //                   thickness: 3,
  //                   color: AppColors.contentColor,
  //                 )),
  //                 SizedBox(width: 8),
  //                 Text(
  //                   'Popular APK on ApkFyp',
  //                   style: AppTextStyle.large,
  //                 ),
  //                 SizedBox(width: 8),
  //                 Expanded(
  //                     child: Divider(
  //                   thickness: 3,
  //                   color: AppColors.contentColor,
  //                 )),
  //               ],
  //             ),
  //           ),
  //           SizedBox(
  //             height: 150,
  //           ),
  //           SizedBox(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 TopGameCircle(
  //                   topNumber: '2',
  //                   imageUrl: 'https://robohash.org/top/2',
  //                 ),
  //                 SizedBox(width: 80),
  //                 Transform.translate(
  //                   offset: Offset(0, -80),
  //                   child: TopGameCircle(
  //                       topNumber: '1', imageUrl: 'https://robohash.org/top/1'),
  //                 ),
  //                 SizedBox(width: 80),
  //                 TopGameCircle(
  //                     topNumber: '3', imageUrl: 'https://robohash.org/top/3')
  //               ],
  //             ),
  //           ),
  //           GridView.count(
  //             padding: const EdgeInsets.all(20).copyWith(top: 50),
  //             crossAxisCount: 3,
  //             childAspectRatio: 5,
  //             shrinkWrap: true,

  //             // padding: const EdgeInsets.all(4.0),
  //             mainAxisSpacing: 30,
  //             crossAxisSpacing: 30,
  //             children: List.generate(8, (index) {
  //               return GameItem(
  //                 bgColor: true,
  //                 showBorder: false,
  //                 onTap: () {
  //                   CommonNavigator.go(context, routeName: 'title$index');
  //                 },
  //               );
  //             }).toList(),
  //           ),
  //           SizedBox(
  //             height: 80,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 8),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: [
  //                 Expanded(
  //                     child: Divider(
  //                   thickness: 3,
  //                   color: AppColors.contentColor,
  //                 )),
  //                 SizedBox(width: 8),
  //                 Text(
  //                   'Latest APK on ApkFyp',
  //                   style: AppTextStyle.large,
  //                 ),
  //                 SizedBox(width: 8),
  //                 Expanded(
  //                     child: Divider(
  //                   thickness: 3,
  //                   color: AppColors.contentColor,
  //                 )),
  //               ],
  //             ),
  //           ),
  //           GridView.count(
  //             padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
  //             crossAxisCount: 3,
  //             childAspectRatio: 5,
  //             shrinkWrap: true,

  //             // padding: const EdgeInsets.all(4.0),
  //             mainAxisSpacing: 30,
  //             crossAxisSpacing: 30,
  //             children: List.generate(24, (index) {
  //               return GameItem(
  //                 showBorder: true,
  //                 onTap: () {},
  //               );
  //             }).toList(),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 16),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: List.generate(6, (index) {
  //                 if (index == 3) {
  //                   return Text('...');
  //                 }
  //                 return Container(
  //                   height: 30,
  //                   width: 30,
  //                   margin: EdgeInsets.symmetric(horizontal: 8),
  //                   decoration: BoxDecoration(
  //                     color: index == 0 ? AppColors.contentColor : null,
  //                     border: Border.all(width: 1, color: Colors.grey),
  //                     borderRadius: BorderRadius.circular(4),
  //                   ),
  //                   child: Center(
  //                       child: index == 5
  //                           ? Icon(Icons.arrow_forward_ios)
  //                           : Text(
  //                               index == 4 ? '23' : '${index + 1}',
  //                               style: AppTextStyle.medium,
  //                             )),
  //                 );
  //               }).toList(),
  //             ),
  //           ),
  //           SizedBox(height: 80),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   'New Update Games',
  //                   style: AppTextStyle.medium.copyWith(
  //                     fontSize: 26,
  //                     fontWeight: FontWeight.bold,
  //                     color: AppColors.materialColor,
  //                   ),
  //                 ),
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //                   decoration: BoxDecoration(
  //                       color: AppColors.materialColor,
  //                       borderRadius: BorderRadius.circular(8)),
  //                   child: Row(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         'All Games',
  //                         style:
  //                             AppTextStyle.medium.copyWith(color: Colors.white),
  //                       ),
  //                       SizedBox(width: 8),
  //                       Icon(
  //                         Icons.arrow_forward_ios_outlined,
  //                         size: 16,
  //                         color: Colors.white,
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //           SizedBox(height: 24),
  //           GridView.count(
  //             padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
  //             crossAxisCount: 3,
  //             childAspectRatio: 5,
  //             shrinkWrap: true,

  //             // padding: const EdgeInsets.all(4.0),
  //             mainAxisSpacing: 30,
  //             crossAxisSpacing: 30,
  //             children: List.generate(9, (index) {
  //               return GameItem(
  //                 showBorder: true,
  //                 onTap: () {},
  //               );
  //             }).toList(),
  //           ),
  //           SizedBox(height: 24),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   'New Update Apps',
  //                   style: AppTextStyle.medium.copyWith(
  //                     fontSize: 26,
  //                     fontWeight: FontWeight.bold,
  //                     color: AppColors.materialColor,
  //                   ),
  //                 ),
  //                 Container(
  //                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //                   decoration: BoxDecoration(
  //                       color: AppColors.materialColor,
  //                       borderRadius: BorderRadius.circular(8)),
  //                   child: Row(
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         'All Apps',
  //                         style:
  //                             AppTextStyle.medium.copyWith(color: Colors.white),
  //                       ),
  //                       SizedBox(width: 8),
  //                       Icon(
  //                         Icons.arrow_forward_ios_outlined,
  //                         size: 16,
  //                         color: Colors.white,
  //                       )
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           ),
  //           SizedBox(height: 24),
  //           GridView.count(
  //             padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
  //             crossAxisCount: 3,
  //             childAspectRatio: 5,
  //             shrinkWrap: true,

  //             // padding: const EdgeInsets.all(4.0),
  //             mainAxisSpacing: 30,
  //             crossAxisSpacing: 30,
  //             children: List.generate(9, (index) {
  //               return GameItem(
  //                 showBorder: true,
  //                 onTap: () {},
  //               );
  //             }).toList(),
  //           ),
  //           SizedBox(height: 24),
  //           FooterItem()
  //         ],
  //       ),
  //     ),
    
//   }
// }
