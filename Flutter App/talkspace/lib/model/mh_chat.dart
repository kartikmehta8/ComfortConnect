import 'package:freezed_annotation/freezed_annotation.dart';

part 'mh_chat.freezed.dart';

@freezed
class MhChat with _$MhChat {
  factory MhChat({
    String? uid,
    String? profileImg,
    String? msg,
    String? time,
    bool? isSend,
  }) = _MhChat;
}
