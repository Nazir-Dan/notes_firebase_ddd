// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icon_switch_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IconSwitchData {
  bool get toggle => throw _privateConstructorUsedError;
  Icon get icon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IconSwitchDataCopyWith<IconSwitchData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IconSwitchDataCopyWith<$Res> {
  factory $IconSwitchDataCopyWith(
          IconSwitchData value, $Res Function(IconSwitchData) then) =
      _$IconSwitchDataCopyWithImpl<$Res, IconSwitchData>;
  @useResult
  $Res call({bool toggle, Icon icon});
}

/// @nodoc
class _$IconSwitchDataCopyWithImpl<$Res, $Val extends IconSwitchData>
    implements $IconSwitchDataCopyWith<$Res> {
  _$IconSwitchDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggle = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      toggle: null == toggle
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IconSwitchDataImplCopyWith<$Res>
    implements $IconSwitchDataCopyWith<$Res> {
  factory _$$IconSwitchDataImplCopyWith(_$IconSwitchDataImpl value,
          $Res Function(_$IconSwitchDataImpl) then) =
      __$$IconSwitchDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool toggle, Icon icon});
}

/// @nodoc
class __$$IconSwitchDataImplCopyWithImpl<$Res>
    extends _$IconSwitchDataCopyWithImpl<$Res, _$IconSwitchDataImpl>
    implements _$$IconSwitchDataImplCopyWith<$Res> {
  __$$IconSwitchDataImplCopyWithImpl(
      _$IconSwitchDataImpl _value, $Res Function(_$IconSwitchDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toggle = null,
    Object? icon = null,
  }) {
    return _then(_$IconSwitchDataImpl(
      toggle: null == toggle
          ? _value.toggle
          : toggle // ignore: cast_nullable_to_non_nullable
              as bool,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon,
    ));
  }
}

/// @nodoc

class _$IconSwitchDataImpl
    with DiagnosticableTreeMixin
    implements _IconSwitchData {
  const _$IconSwitchDataImpl({required this.toggle, required this.icon});

  @override
  final bool toggle;
  @override
  final Icon icon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IconSwitchData(toggle: $toggle, icon: $icon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IconSwitchData'))
      ..add(DiagnosticsProperty('toggle', toggle))
      ..add(DiagnosticsProperty('icon', icon));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IconSwitchDataImpl &&
            (identical(other.toggle, toggle) || other.toggle == toggle) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toggle, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IconSwitchDataImplCopyWith<_$IconSwitchDataImpl> get copyWith =>
      __$$IconSwitchDataImplCopyWithImpl<_$IconSwitchDataImpl>(
          this, _$identity);
}

abstract class _IconSwitchData implements IconSwitchData {
  const factory _IconSwitchData(
      {required final bool toggle,
      required final Icon icon}) = _$IconSwitchDataImpl;

  @override
  bool get toggle;
  @override
  Icon get icon;
  @override
  @JsonKey(ignore: true)
  _$$IconSwitchDataImplCopyWith<_$IconSwitchDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
