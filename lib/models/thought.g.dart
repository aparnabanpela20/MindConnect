// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thought.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThoughtAdapter extends TypeAdapter<Thought> {
  @override
  final int typeId = 0;

  @override
  Thought read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Thought(
      text: fields[0] as String,
      author: fields[1] as String?,
      fetchedAt: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Thought obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.fetchedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThoughtAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
