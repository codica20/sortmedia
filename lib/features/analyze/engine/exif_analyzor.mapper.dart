// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'exif_analyzor.dart';

class ExifAnalyzorMapper extends SubClassMapperBase<ExifAnalyzor> {
  ExifAnalyzorMapper._();

  static ExifAnalyzorMapper? _instance;
  static ExifAnalyzorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExifAnalyzorMapper._());
      AnalyzorMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ExifAnalyzor';

  static bool _$enabled(ExifAnalyzor v) => v.enabled;
  static const Field<ExifAnalyzor, bool> _f$enabled = Field(
    'enabled',
    _$enabled,
  );

  @override
  final MappableFields<ExifAnalyzor> fields = const {#enabled: _f$enabled};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'ExifAnalyzor';
  @override
  late final ClassMapperBase superMapper = AnalyzorMapper.ensureInitialized();

  static ExifAnalyzor _instantiate(DecodingData data) {
    return ExifAnalyzor(enabled: data.dec(_f$enabled));
  }

  @override
  final Function instantiate = _instantiate;

  static ExifAnalyzor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ExifAnalyzor>(map);
  }

  static ExifAnalyzor fromJson(String json) {
    return ensureInitialized().decodeJson<ExifAnalyzor>(json);
  }
}

mixin ExifAnalyzorMappable {
  String toJson() {
    return ExifAnalyzorMapper.ensureInitialized().encodeJson<ExifAnalyzor>(
      this as ExifAnalyzor,
    );
  }

  Map<String, dynamic> toMap() {
    return ExifAnalyzorMapper.ensureInitialized().encodeMap<ExifAnalyzor>(
      this as ExifAnalyzor,
    );
  }

  ExifAnalyzorCopyWith<ExifAnalyzor, ExifAnalyzor, ExifAnalyzor> get copyWith =>
      _ExifAnalyzorCopyWithImpl<ExifAnalyzor, ExifAnalyzor>(
        this as ExifAnalyzor,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExifAnalyzorMapper.ensureInitialized().stringifyValue(
      this as ExifAnalyzor,
    );
  }

  @override
  bool operator ==(Object other) {
    return ExifAnalyzorMapper.ensureInitialized().equalsValue(
      this as ExifAnalyzor,
      other,
    );
  }

  @override
  int get hashCode {
    return ExifAnalyzorMapper.ensureInitialized().hashValue(
      this as ExifAnalyzor,
    );
  }
}

extension ExifAnalyzorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ExifAnalyzor, $Out> {
  ExifAnalyzorCopyWith<$R, ExifAnalyzor, $Out> get $asExifAnalyzor =>
      $base.as((v, t, t2) => _ExifAnalyzorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExifAnalyzorCopyWith<$R, $In extends ExifAnalyzor, $Out>
    implements AnalyzorCopyWith<$R, $In, $Out> {
  @override
  $R call({bool? enabled});
  ExifAnalyzorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ExifAnalyzorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ExifAnalyzor, $Out>
    implements ExifAnalyzorCopyWith<$R, ExifAnalyzor, $Out> {
  _ExifAnalyzorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ExifAnalyzor> $mapper =
      ExifAnalyzorMapper.ensureInitialized();
  @override
  $R call({bool? enabled}) =>
      $apply(FieldCopyWithData({if (enabled != null) #enabled: enabled}));
  @override
  ExifAnalyzor $make(CopyWithData data) =>
      ExifAnalyzor(enabled: data.get(#enabled, or: $value.enabled));

  @override
  ExifAnalyzorCopyWith<$R2, ExifAnalyzor, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ExifAnalyzorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

