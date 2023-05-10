// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailModelAdapter extends TypeAdapter<DetailModel> {
  @override
  final int typeId = 1;

  @override
  DetailModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailModel(
      name: fields[0] as String?,
      email: fields[1] as String?,
      phone: fields[2] as String?,
      address: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DetailModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
