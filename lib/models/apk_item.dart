// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:apkfree/models/faq.dart';
import 'package:apkfree/utils/enums.dart';
import 'package:flutter/foundation.dart';

class ApkItem {
  final ApkType type;
  final String? name;
  final String? compatibleWith;
  final String? apkSize;
  final String? lastVersion;
  final String? lastUpdate;
  final String? development;
  final List<String>? screenShotUrl;
  final List<Faq>? faqs;
  ApkItem({
    required this.type,
    this.name,
    this.compatibleWith,
    this.apkSize,
    this.lastVersion,
    this.lastUpdate,
    this.development,
    this.screenShotUrl,
    this.faqs,
  });

  ApkItem copyWith({
    ApkType? type,
    String? name,
    String? compatibleWith,
    String? apkSize,
    String? lastVersion,
    String? lastUpdate,
    String? development,
    List<String>? screenShotUrl,
    List<Faq>? faqs,
  }) {
    return ApkItem(
      type: type ?? this.type,
      name: name ?? this.name,
      compatibleWith: compatibleWith ?? this.compatibleWith,
      apkSize: apkSize ?? this.apkSize,
      lastVersion: lastVersion ?? this.lastVersion,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      development: development ?? this.development,
      screenShotUrl: screenShotUrl ?? this.screenShotUrl,
      faqs: faqs ?? this.faqs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'name': name,
      'compatibleWith': compatibleWith,
      'apkSize': apkSize,
      'lastVersion': lastVersion,
      'lastUpdate': lastUpdate,
      'development': development,
      'screenShotUrl': screenShotUrl,
      'faqs': faqs?.map((x) => x.toMap()).toList(),
    };
  }

  factory ApkItem.fromMap(Map<String, dynamic> map) {
    return ApkItem(
      type: ApkType.values.byName(map['type']),
      name: map['name'] != null ? map['name'] as String : null,
      compatibleWith: map['compatibleWith'] != null
          ? map['compatibleWith'] as String
          : null,
      apkSize: map['apkSize'] != null ? map['apkSize'] as String : null,
      lastVersion:
          map['lastVersion'] != null ? map['lastVersion'] as String : null,
      lastUpdate:
          map['lastUpdate'] != null ? map['lastUpdate'] as String : null,
      development:
          map['development'] != null ? map['development'] as String : null,
      screenShotUrl: map['screenShotUrl'] != null
          ? List<String>.from((map['screenShotUrl'] as List<String>))
          : [],
      faqs: map['faqs'] != null
          ? List<Faq>.from(
              (map['faqs'] as List<int>).map<Faq?>(
                (x) => Faq.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApkItem.fromJson(String source) =>
      ApkItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ApkItem(type: $type, name: $name, compatibleWith: $compatibleWith, apkSize: $apkSize, lastVersion: $lastVersion, lastUpdate: $lastUpdate, development: $development, screenShotUrl: $screenShotUrl, faqs: $faqs)';
  }

  @override
  bool operator ==(covariant ApkItem other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.name == name &&
        other.compatibleWith == compatibleWith &&
        other.apkSize == apkSize &&
        other.lastVersion == lastVersion &&
        other.lastUpdate == lastUpdate &&
        other.development == development &&
        listEquals(other.screenShotUrl, screenShotUrl) &&
        listEquals(other.faqs, faqs);
  }

  @override
  int get hashCode {
    return type.hashCode ^
        name.hashCode ^
        compatibleWith.hashCode ^
        apkSize.hashCode ^
        lastVersion.hashCode ^
        lastUpdate.hashCode ^
        development.hashCode ^
        screenShotUrl.hashCode ^
        faqs.hashCode;
  }
}
