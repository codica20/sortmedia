import 'package:dart_mappable/dart_mappable.dart';

/// you shuold register it in main() via
/// `MapperContainer.globals.use(RegExpMapper());`
class RegExpMapper extends SimpleMapper<RegExp> {
  const RegExpMapper();

  @override
  RegExp decode(dynamic value) {
    return RegExp(value as String);
  }

  @override
  dynamic encode(RegExp value) {
    return value.pattern;
  }
}
