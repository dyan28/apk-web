import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:students/components/app_text_style.dart';

class TopGameCircle extends StatelessWidget {
  const TopGameCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 100,
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              border: Border.all(width: 3, color: Colors.red),
            ),
          ),
          Positioned(
            bottom: 4,
            left: 30,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(90),
                border: Border.all(width: 1, color: Colors.red),
              ),
              child: Center(
                child: Transform.translate(
                  offset: Offset(0, -6),
                  child: Text(
                    '1',
                    style: AppTextStyle.medium
                        .copyWith(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
