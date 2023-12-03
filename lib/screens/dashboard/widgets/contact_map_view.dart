// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/utils/app_constant.dart';
import 'package:students/utils/utils.dart';

class ContactMapView extends StatelessWidget with Utils {
  const ContactMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          js.context.callMethod('open', [AppConstants.locationUrl]);
        },
        child: Container(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            Assets.images.spaLocation.path,
            width: double.infinity,
            height: screenHeight(context) * 0.5,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
