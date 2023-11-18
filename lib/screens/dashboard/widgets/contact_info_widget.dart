import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/screens/dashboard/widgets/follow_us_widget.dart';
import 'package:students/utils/app_constant.dart';

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({super.key, this.contactKey});

  final GlobalKey? contactKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: contactKey,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            Assets.images.bottomBackgroundImage.path,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 20).copyWith(bottom: 0),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    Assets.images.spaLogoTransparent.path,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _contact(context),
                      const FollowUsWidget(),
                      _map(context),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _map(BuildContext context) {
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
            height: MediaQuery.of(context).size.height * 0.25,
          ),
        ),
      ),
    );
  }

  Widget _contact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          L10n.of(context).Contact,
          style: AppTextStyle.largeNormalLight,
        ),
        _contactRow(
            text: 'Ngõ 44 P. Nguyễn Cơ Thạch, Mỹ Đình, Từ Liêm, Hà Nội',
            icon: const Icon(Icons.location_on, color: Colors.white)),
        _contactRow(
            text: AppConstants.address,
            icon: const Icon(Icons.email, color: Colors.white)),
        _contactRow(
            text: AppConstants.phoneNumber,
            icon: const Icon(
              Icons.phone,
              color: Colors.white,
            )),
      ],
    );
  }

  Widget _contactRow({required String text, required Widget icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            text,
            style: AppTextStyle.regularLight,
          ),
        ],
      ),
    );
  }
}
