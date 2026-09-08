// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'regex_analyzor.dart';

class RegExAnalyzorMapper extends SubClassMapperBase<RegExAnalyzor> {
  RegExAnalyzorMapper._();

  static RegExAnalyzorMapper? _instance;
  static RegExAnalyzorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegExAnalyzorMapper._());
      AnalyzorMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'RegExAnalyzor';

  static RegExp _$regex(RegExAnalyzor v) => v.regex;
  static const Field<RegExAnalyzor, RegExp> _f$regex = Field('regex', _$regex);
  static bool _$enabled(RegExAnalyzor v) => v.enabled;
  static const Field<RegExAnalyzor, bool> _f$enabled = Field(
    'enabled',
    _$enabled,
  );

  @override
  final MappableFields<RegExAnalyzor> fields = const {
    #regex: _f$regex,
    #enabled: _f$enabled,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'RegExAnalyzor';
  @override
  late final ClassMapperBase superMapper = AnalyzorMapper.ensureInitialized();

  static RegExAnalyzor _instantiate(DecodingData data) {
    return RegExAnalyzor(
      regex: data.dec(_f$regex),
      enabled: data.dec(_f$enabled),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static RegExAnalyzor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<RegExAnalyzor>(map);
  }

  static RegExAnalyzor fromJson(String json) {
    return ensureInitialized().decodeJson<RegExAnalyzor>(json);
  }
}

mixin RegExAnalyzorMappable {
  String toJson() {
    return RegExAnalyzorMapper.ensureInitialized().encodeJson<RegExAnalyzor>(
      this as RegExAnalyzor,
    );
  }

  Map<String, dynamic> toMap() {
    return RegExAnalyzorMapper.ensureInitialized().encodeMap<RegExAnalyzor>(
      this as RegExAnalyzor,
    );
  }

  RegExAnalyzorCopyWith<RegExAnalyzor, RegExAnalyzor, RegExAnalyzor>
  get copyWith => _RegExAnalyzorCopyWithImpl<RegExAnalyzor, RegExAnalyzor>(
    this as RegExAnalyzor,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return RegExAnalyzorMapper.ensureInitialized().stringifyValue(
      this as RegExAnalyzor,
    );
  }

  @override
  bool operator ==(Object other) {
    return RegExAnalyzorMapper.ensureInitialized().equalsValue(
      this as RegExAnalyzor,
      other,
    );
  }

  @override
  int get hashCode {
    return RegExAnalyzorMapper.ensureInitialized().hashValue(
      this as RegExAnalyzor,
    );
  }
}

extension RegExAnalyzorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegExAnalyzor, $Out> {
  RegExAnalyzorCopyWith<$R, RegExAnalyzor, $Out> get $asRegExAnalyzor =>
      $base.as((v, t, t2) => _RegExAnalyzorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RegExAnalyzorCopyWith<$R, $In extends RegExAnalyzor, $Out>
    implements AnalyzorCopyWith<$R, $In, $Out> {
  @override
  $R call({RegExp? regex, bool? enabled});
  RegExAnalyzorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RegExAnalyzorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegExAnalyzor, $Out>
    implements RegExAnalyzorCopyWith<$R, RegExAnalyzor, $Out> {
  _RegExAnalyzorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegExAnalyzor> $mapper =
      RegExAnalyzorMapper.ensureInitialized();
  @override
  $R call({RegExp? regex, bool? enabled}) => $apply(
    FieldCopyWithData({
      if (regex != null) #regex: regex,
      if (enabled != null) #enabled: enabled,
    }),
  );
  @override
  RegExAnalyzor $make(CopyWithData data) => RegExAnalyzor(
    regex: data.get(#regex, or: $value.regex),
    enabled: data.get(#enabled, or: $value.enabled),
  );

  @override
  RegExAnalyzorCopyWith<$R2, RegExAnalyzor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RegExAnalyzorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

