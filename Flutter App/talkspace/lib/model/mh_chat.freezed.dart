// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mh_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MhChatTearOff {
  const _$MhChatTearOff();

  _MhChat call(
      {String? uid,
      String? profileImg,
      String? msg,
      String? time,
      bool? isSend}) {
    return _MhChat(
      uid: uid,
      profileImg: profileImg,
      msg: msg,
      time: time,
      isSend: isSend,
    );
  }
}

/// @nodoc
const $MhChat = _$MhChatTearOff();

/// @nodoc
mixin _$MhChat {
  String? get uid => throw _privateConstructorUsedError;
  String? get profileImg => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  bool? get isSend => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MhChatCopyWith<MhChat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MhChatCopyWith<$Res> {
  factory $MhChatCopyWith(MhChat value, $Res Function(MhChat) then) =
      _$MhChatCopyWithImpl<$Res>;
  $Res call(
      {String? uid,
      String? profileImg,
      String? msg,
      String? time,
      bool? isSend});
}

/// @nodoc
class _$MhChatCopyWithImpl<$Res> implements $MhChatCopyWith<$Res> {
  _$MhChatCopyWithImpl(this._value, this._then);

  final MhChat _value;
  // ignore: unused_field
  final $Res Function(MhChat) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? profileImg = freezed,
    Object? msg = freezed,
    Object? time = freezed,
    Object? isSend = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: profileImg == freezed
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      isSend: isSend == freezed
          ? _value.isSend
          : isSend // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$MhChatCopyWith<$Res> implements $MhChatCopyWith<$Res> {
  factory _$MhChatCopyWith(_MhChat value, $Res Function(_MhChat) then) =
      __$MhChatCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? uid,
      String? profileImg,
      String? msg,
      String? time,
      bool? isSend});
}

/// @nodoc
class __$MhChatCopyWithImpl<$Res> extends _$MhChatCopyWithImpl<$Res>
    implements _$MhChatCopyWith<$Res> {
  __$MhChatCopyWithImpl(_MhChat _value, $Res Function(_MhChat) _then)
      : super(_value, (v) => _then(v as _MhChat));

  @override
  _MhChat get _value => super._value as _MhChat;

  @override
  $Res call({
    Object? uid = freezed,
    Object? profileImg = freezed,
    Object? msg = freezed,
    Object? time = freezed,
    Object? isSend = freezed,
  }) {
    return _then(_MhChat(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: profileImg == freezed
          ? _value.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      isSend: isSend == freezed
          ? _value.isSend
          : isSend // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_MhChat implements _MhChat {
  _$_MhChat({this.uid, this.profileImg, this.msg, this.time, this.isSend});

  @override
  final String? uid;
  @override
  final String? profileImg;
  @override
  final String? msg;
  @override
  final String? time;
  @override
  final bool? isSend;

  @override
  String toString() {
    return 'MhChat(uid: $uid, profileImg: $profileImg, msg: $msg, time: $time, isSend: $isSend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MhChat &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality()
                .equals(other.profileImg, profileImg) &&
            const DeepCollectionEquality().equals(other.msg, msg) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.isSend, isSend));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(profileImg),
      const DeepCollectionEquality().hash(msg),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(isSend));

  @JsonKey(ignore: true)
  @override
  _$MhChatCopyWith<_MhChat> get copyWith =>
      __$MhChatCopyWithImpl<_MhChat>(this, _$identity);
}

abstract class _MhChat implements MhChat {
  factory _MhChat(
      {String? uid,
      String? profileImg,
      String? msg,
      String? time,
      bool? isSend}) = _$_MhChat;

  @override
  String? get uid;
  @override
  String? get profileImg;
  @override
  String? get msg;
  @override
  String? get time;
  @override
  bool? get isSend;
  @override
  @JsonKey(ignore: true)
  _$MhChatCopyWith<_MhChat> get copyWith => throw _privateConstructorUsedError;
}