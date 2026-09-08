// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'analyzor.dart';

class MyClassMapper extends ClassMapperBase<MyClass> {
  MyClassMapper._();

  static MyClassMapper? _instance;
  static MyClassMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MyClassMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'MyClass';

  static bool _$myValue(MyClass v) => v.myValue;
  static const Field<MyClass, bool> _f$myValue = Field('myValue', _$myValue);

  @override
  final MappableFields<MyClass> fields = const {#myValue: _f$myValue};

  static MyClass _instantiate(DecodingData data) {
    return MyClass(data.dec(_f$myValue));
  }

  @override
  final Function instantiate = _instantiate;

  static MyClass fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MyClass>(map);
  }

  static MyClass fromJson(String json) {
    return ensureInitialized().decodeJson<MyClass>(json);
  }
}

mixin MyClassMappable {
  String toJson() {
    return MyClassMapper.ensureInitialized().encodeJson<MyClass>(
      this as MyClass,
    );
  }

  Map<String, dynamic> toMap() {
    return MyClassMapper.ensureInitialized().encodeMap<MyClass>(
      this as MyClass,
    );
  }

  MyClassCopyWith<MyClass, MyClass, MyClass> get copyWith =>
      _MyClassCopyWithImpl<MyClass, MyClass>(
        this as MyClass,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return MyClassMapper.ensureInitialized().stringifyValue(this as MyClass);
  }

  @override
  bool operator ==(Object other) {
    return MyClassMapper.ensureInitialized().equalsValue(
      this as MyClass,
      other,
    );
  }

  @override
  int get hashCode {
    return MyClassMapper.ensureInitialized().hashValue(this as MyClass);
  }
}

extension MyClassValueCopy<$R, $Out> on ObjectCopyWith<$R, MyClass, $Out> {
  MyClassCopyWith<$R, MyClass, $Out> get $asMyClass =>
      $base.as((v, t, t2) => _MyClassCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MyClassCopyWith<$R, $In extends MyClass, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? myValue});
  MyClassCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MyClassCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MyClass, $Out>
    implements MyClassCopyWith<$R, MyClass, $Out> {
  _MyClassCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MyClass> $mapper =
      MyClassMapper.ensureInitialized();
  @override
  $R call({bool? myValue}) =>
      $apply(FieldCopyWithData({if (myValue != null) #myValue: myValue}));
  @override
  MyClass $make(CopyWithData data) =>
      MyClass(data.get(#myValue, or: $value.myValue));

  @override
  MyClassCopyWith<$R2, MyClass, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _MyClassCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class AnalyzorMapper extends ClassMapperBase<Analyzor> {
  AnalyzorMapper._();

  static AnalyzorMapper? _instance;
  static AnalyzorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AnalyzorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Analyzor';

  static bool _$enabled(Analyzor v) => v.enabled;
  static const Field<Analyzor, bool> _f$enabled = Field('enabled', _$enabled);

  @override
  final MappableFields<Analyzor> fields = const {#enabled: _f$enabled};

  static Analyzor _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('Analyzor');
  }

  @override
  final Function instantiate = _instantiate;

  static Analyzor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Analyzor>(map);
  }

  static Analyzor fromJson(String json) {
    return ensureInitialized().decodeJson<Analyzor>(json);
  }
}

mixin AnalyzorMappable {
  String toJson();
  Map<String, dynamic> toMap();
  AnalyzorCopyWith<Analyzor, Analyzor, Analyzor> get copyWith;
}

abstract class AnalyzorCopyWith<$R, $In extends Analyzor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({bool? enabled});
  AnalyzorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

