import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_item_model.freezed.dart';

part 'shopping_item_model.g.dart';

@freezed
class ShoppingItemModel with _$ShoppingItemModel {
  const ShoppingItemModel._();

  const factory ShoppingItemModel({
    String? title,
    String? image,
    num? price,
  }) = _ShoppingItemModel;

  factory ShoppingItemModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingItemModelFromJson(json);
}