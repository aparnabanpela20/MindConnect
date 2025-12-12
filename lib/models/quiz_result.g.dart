// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_result.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuizResultAdapter extends TypeAdapter<QuizResult> {
  @override
  final int typeId = 1;

  @override
  QuizResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuizResult(
      score: fields[0] as int,
      answers: (fields[2] as List).cast<int>(),
      takenAt: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, QuizResult obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.score)
      ..writeByte(1)
      ..write(obj.takenAt)
      ..writeByte(2)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuizResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
