import 'package:flutter/material.dart';
import 'package:students/generated/l10n.dart';
import 'package:students/utils/app_colors.dart';
import 'package:students/utils/app_constant.dart';
import 'package:collection/collection.dart';
import 'package:students/utils/enums.dart';

class OpenStatusUtil {
  static OpenStatus getStatus() {
    final date = DateTime.now();

    final dayOfWeek = date.weekday;

    final openHour = AppConstants.dummyOpenHour
        .firstWhereOrNull((e) => e.dayOfWeek == dayOfWeek);

    if (openHour == null) {
      return OpenStatus.close;
    }

    final startDate = DateTime(date.year, date.month, date.day,
        openHour.startHour ?? 0, openHour.startMinute ?? 0);
    final endDate = DateTime(date.year, date.month, date.day,
        openHour.endHour ?? 0, openHour.endMinute ?? 0);

    if (startDate.isBefore(date) && endDate.isAfter(date)) {
      return OpenStatus.open;
    }
    return OpenStatus.close;
  }

  static Color getStatusColor() {
    final openStatus = getStatus();

    switch (openStatus) {
      case OpenStatus.open:
        return AppColors.successColor;
      case OpenStatus.close:
        return AppColors.errorColor;
    }
  }

  static String getStatusText(BuildContext context) {
    final openStatus = getStatus();

    switch (openStatus) {
      case OpenStatus.open:
        return L10n.of(context).Open;
      case OpenStatus.close:
        return L10n.of(context).Close;
    }
  }
}
