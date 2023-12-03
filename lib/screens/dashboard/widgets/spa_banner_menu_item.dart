import 'package:flutter/material.dart';
import 'package:students/components/app_text_style.dart';

class SpaBannerMenuItem extends StatefulWidget {
  const SpaBannerMenuItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  State<SpaBannerMenuItem> createState() => _SpaBannerMenuItemState();
}

class _SpaBannerMenuItemState extends State<SpaBannerMenuItem> {
  bool isHoover = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MouseRegion(
        onHover: (value) {
          setState(() {
            isHoover = true;
          });
        },
        onExit: (value) {
          setState(() {
            isHoover = false;
          });
        },
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: isHoover
                    ? Colors.white.withOpacity(0.3)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: AppTextStyle.largeNormalLight,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
