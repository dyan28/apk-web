import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_hour_model.freezed.dart';

part 'open_hour_model.g.dart';

@freezed
class OpenHourModel with _$OpenHourModel {
  const OpenHourModel._();

  const factory OpenHourModel({
    int? dayOfWeek,
    int? startHour,
    int? startMinute,
    int? endHour,
    int? endMinute,
  }) = _OpenHourModel;

  factory OpenHourModel.fromJson(Map<String, dynamic> json) =>
      _$OpenHourModelFromJson(json);
}