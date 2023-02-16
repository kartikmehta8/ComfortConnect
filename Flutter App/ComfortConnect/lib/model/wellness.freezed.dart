// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wellness.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WellnessTearOff {
  const _$WellnessTearOff();

  _Wellness call(
      {String? img,
      String? title,
      String? subtitle,
      String? time,
      bool? isLock}) {
    return _Wellness(
      img: img,
      title: title,
      subtitle: subtitle,
      time: time,
      isLock: isLock,
    );
  }
}

/// @nodoc
const $Wellness = _$WellnessTearOff();

/// @nodoc
mixin _$Wellness {
  String? get img => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  bool? get isLock => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WellnessCopyWith<Wellness> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WellnessCopyWith<$Res> {
  factory $WellnessCopyWith(Wellness value, $Res Function(Wellness) then) =
      _$WellnessCopyWithImpl<$Res>;
  $Res call(
      {String? img,
      String? title,
      String? subtitle,
      String? time,
      bool? isLock});
}

/// @nodoc
class _$WellnessCopyWithImpl<$Res> implements $WellnessCopyWith<$Res> {
  _$WellnessCopyWithImpl(this._value, this._then);

  final Wellness _value;
  // ignore: unused_field
  final $Res Function(Wellness) _then;

  @override
  $Res call({
    Object? img = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? time = freezed,
    Object? isLock = freezed,
  }) {
    return _then(_value.copyWith(
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      isLock: isLock == freezed
          ? _value.isLock
          : isLock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$WellnessCopyWith<$Res> implements $WellnessCopyWith<$Res> {
  factory _$WellnessCopyWith(_Wellness value, $Res Function(_Wellness) then) =
      __$WellnessCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? img,
      String? title,
      String? subtitle,
      String? time,
      bool? isLock});
}

/// @nodoc
class __$WellnessCopyWithImpl<$Res> extends _$WellnessCopyWithImpl<$Res>
    implements _$WellnessCopyWith<$Res> {
  __$WellnessCopyWithImpl(_Wellness _value, $Res Function(_Wellness) _then)
      : super(_value, (v) => _then(v as _Wellness));

  @override
  _Wellness get _value => super._value as _Wellness;

  @override
  $Res call({
    Object? img = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? time = freezed,
    Object? isLock = freezed,
  }) {
    return _then(_Wellness(
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      isLock: isLock == freezed
          ? _value.isLock
          : isLock // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_Wellness implements _Wellness {
  _$_Wellness({this.img, this.title, this.subtitle, this.time, this.isLock});

  @override
  final String? img;
  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? time;
  @override
  final bool? isLock;

  @override
  String toString() {
    return 'Wellness(img: $img, title: $title, subtitle: $subtitle, time: $time, isLock: $isLock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Wellness &&
            const DeepCollectionEquality().equals(other.img, img) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.subtitle, subtitle) &&
            const DeepCollectionEquality().equals(other.time, time) &&
            const DeepCollectionEquality().equals(other.isLock, isLock));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(img),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(subtitle),
      const DeepCollectionEquality().hash(time),
      const DeepCollectionEquality().hash(isLock));

  @JsonKey(ignore: true)
  @override
  _$WellnessCopyWith<_Wellness> get copyWith =>
      __$WellnessCopyWithImpl<_Wellness>(this, _$identity);
}

abstract class _Wellness implements Wellness {
  factory _Wellness(
      {String? img,
      String? title,
      String? subtitle,
      String? time,
      bool? isLock}) = _$_Wellness;

  @override
  String? get img;
  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get time;
  @override
  bool? get isLock;
  @override
  @JsonKey(ignore: true)
  _$WellnessCopyWith<_Wellness> get copyWith =>
      throw _privateConstructorUsedError;
}