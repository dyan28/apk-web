import 'package:flutter/material.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/screens/dashboard/widgets/follow_us_widget.dart';
import 'package:students/screens/dashboard/widgets/logo_view.dart';
import 'package:students/utils/app_constant.dart';
import 'package:students/utils/utils.dart';

class ContactInfoWidget extends StatelessWidget with Utils {
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
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: isSmallLayout(context) ? 30 : screenWidth(context) * 0.2,
              ),
              const Flexible(child: FittedBox(child: LogoView())),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: _contact(context),
                      ),
                      const FollowUsWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _contact(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contactRow(
            text: 'Ngõ 44 P. Nguyễn Cơ Thạch, Mỹ Đình, Từ Liêm, Hà Nội',
            icon: const Icon(Icons.location_on, color: Colors.white)),
        _contactRow(
            text: AppConstants.address,
            icon: const Icon(Icons.email, color: Colors.white)),
        _contactRow(
            text: 'Hotline: ${AppConstants.phoneNumber}',
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
          Expanded(
            child: Text(
              text,
              style: AppTextStyle.regularLight,
            ),
          ),
        ],
      ),
    );
  }
}
