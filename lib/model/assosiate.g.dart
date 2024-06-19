// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assosiate.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssosiateAdapter extends TypeAdapter<Assosiate> {
  @override
  final int typeId = 5;

  @override
  Assosiate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Assosiate(
      name: fields[0] as String,
      phone: fields[1] as int,
      isSenior: fields[2] as bool,
      join: fields[3] as DateTime,
      age: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Assosiate obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.isSenior)
      ..writeByte(3)
      ..write(obj.join)
      ..writeByte(4)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssosiateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
