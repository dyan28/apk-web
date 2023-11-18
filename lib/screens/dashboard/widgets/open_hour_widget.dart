import 'package:flutter/material.dart';
import 'package:students/components/app_text_style.dart';
import 'package:students/generated/assets.gen.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/utils/open_status_util.dart';

class OpenHourWidget extends StatelessWidget {
  const OpenHourWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 20).copyWith(bottom: 0),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _openStatus(context),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      _hour(context),
                      Image.asset(Assets.images.spaMenu.path, fit: BoxFit.cover,)
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

  Widget _openStatus(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          L10n.of(context).spa_name,
          style: AppTextStyle.extraLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: OpenStatusUtil.getStatusColor(),
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Text(
                OpenStatusUtil.getStatusText(context),
                style: AppTextStyle.medium,
              ),
            ),
          ],
        ),

      ],
    ));
  }

  Widget _hour(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          L10n.of(context).open_hour,
          style: AppTextStyle.large,
        ),
        _hourRow(title: L10n.of(context).mon_to_fri, content: '09 am- 6pm'),
        _hourRow(title: L10n.of(context).sat, content: '10 am- 7pm'),
        _hourRow(title: L10n.of(context).sunday, content: '10 am- 7pm'),
      ],
    );
  }

  Widget _hourRow({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(
            '$title - ',
            style: AppTextStyle.regular,
          )),
          Expanded(
              child: Text(
            content,
            style: AppTextStyle.regular,
          )),
        ],
      ),
    );
  }
}
