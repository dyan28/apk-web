import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/generated/assets.gen.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          SizedBox(
            width: 69,
            child: Image.asset(
              Assets.images.spaLogoTransparent.path,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: double.infinity,
            child: RichText(
              text: TextSpan(
                  style: AppTextStyle.largeNormal.copyWith(color: Colors.white),
                  children: [
                    const TextSpan(
                        text: 'NGỌT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32)),
                    TextSpan(
                      text: '\nBeauty & Spa',
                      style: GoogleFonts.allison(),
                    )
                  ]),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
