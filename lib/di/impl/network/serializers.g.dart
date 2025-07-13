// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers =
    (Serializers().toBuilder()
          ..add(EntityDaily.serializer)
          ..add(EntityLocation.serializer)
          ..add(EntityLocationContainer.serializer)
          ..add(EntityWeather.serializer)
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(EntityLocation)]),
            () => ListBuilder<EntityLocation>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType.nullable(String)]),
            () => ListBuilder<String?>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType.nullable(double)]),
            () => ListBuilder<double?>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType.nullable(double)]),
            () => ListBuilder<double?>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType.nullable(int)]),
            () => ListBuilder<int?>(),
          ))
        .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
