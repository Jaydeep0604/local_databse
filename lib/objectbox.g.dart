// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'model/object_box_detail_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 5691311290973543876),
      name: 'ObjectBoxDetailModel',
      lastPropertyId: const IdUid(5, 7576407202962855904),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 3243882424386310763),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5936541756064134902),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 5682194482604218503),
            name: 'email',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 3880581996625526763),
            name: 'phone',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 7576407202962855904),
            name: 'address',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 5691311290973543876),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ObjectBoxDetailModel: EntityDefinition<ObjectBoxDetailModel>(
        model: _entities[0],
        toOneRelations: (ObjectBoxDetailModel object) => [],
        toManyRelations: (ObjectBoxDetailModel object) => {},
        getId: (ObjectBoxDetailModel object) => object.id,
        setId: (ObjectBoxDetailModel object, int id) {
          object.id = id;
        },
        objectToFB: (ObjectBoxDetailModel object, fb.Builder fbb) {
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final emailOffset =
              object.email == null ? null : fbb.writeString(object.email!);
          final phoneOffset =
              object.phone == null ? null : fbb.writeString(object.phone!);
          final addressOffset =
              object.address == null ? null : fbb.writeString(object.address!);
          fbb.startTable(6);
          fbb.addInt64(0, object.id ?? 0);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, emailOffset);
          fbb.addOffset(3, phoneOffset);
          fbb.addOffset(4, addressOffset);
          fbb.finish(fbb.endTable());
          return object.id ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = ObjectBoxDetailModel(
              id: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              name: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              email: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 8),
              phone: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 10),
              address: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 12));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ObjectBoxDetailModel] entity fields to define ObjectBox queries.
class ObjectBoxDetailModel_ {
  /// see [ObjectBoxDetailModel.id]
  static final id =
      QueryIntegerProperty<ObjectBoxDetailModel>(_entities[0].properties[0]);

  /// see [ObjectBoxDetailModel.name]
  static final name =
      QueryStringProperty<ObjectBoxDetailModel>(_entities[0].properties[1]);

  /// see [ObjectBoxDetailModel.email]
  static final email =
      QueryStringProperty<ObjectBoxDetailModel>(_entities[0].properties[2]);

  /// see [ObjectBoxDetailModel.phone]
  static final phone =
      QueryStringProperty<ObjectBoxDetailModel>(_entities[0].properties[3]);

  /// see [ObjectBoxDetailModel.address]
  static final address =
      QueryStringProperty<ObjectBoxDetailModel>(_entities[0].properties[4]);
}