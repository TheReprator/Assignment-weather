import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'location.g.dart';

abstract class EntityLocationContainer
    implements Built<EntityLocationContainer, EntityLocationContainerBuilder> {
  EntityLocationContainer._();

  BuiltList<EntityLocation>? get results;

  factory EntityLocationContainer([
    void Function(EntityLocationContainerBuilder) updates,
  ]) = _$EntityLocationContainer;

  static Serializer<EntityLocationContainer> get serializer =>
      _$entityLocationContainerSerializer;
}

abstract class EntityLocation
    implements Built<EntityLocation, EntityLocationBuilder> {
  EntityLocation._();

  int? get id;
  String? get name;
  double? get latitude;
  double? get longitude;

  factory EntityLocation([void Function(EntityLocationBuilder) updates]) =
      _$EntityLocation;

  static Serializer<EntityLocation> get serializer =>
      _$entityLocationSerializer;
}
