import 'package:flutter/material.dart';
import 'package:apkfree/utils/app_colors.dart';

class GameItem extends StatelessWidget {
  const GameItem(
      {super.key,
      this.bgColor = false,
      this.showBorder = false,
      required this.onTap});
  final bool bgColor;
  final bool showBorder;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: bgColor ? AppColors.contentColor : null,
              borderRadius: BorderRadius.circular(12),
              border: showBorder
                  ? Border.all(width: 2, color: AppColors.contentColor)
                  : null,
            ),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 70,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 2, color: Colors.grey),
                  ),
                  child: Image.network("https://robohash.org/2"),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Game Title',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Text("Action"),
                            ),
                            SizedBox(width: 16),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Text(
                                "v1.9.68",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
