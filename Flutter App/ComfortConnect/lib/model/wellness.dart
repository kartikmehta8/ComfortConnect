import 'package:freezed_annotation/freezed_annotation.dart';

part 'wellness.freezed.dart';

@freezed
class Wellness with _$Wellness {
  factory Wellness({
    String? img,
    String? title,
    String? subtitle,
    String? time,
    bool? isLock,
  }) = _Wellness;
}
