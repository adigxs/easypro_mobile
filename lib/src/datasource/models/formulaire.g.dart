// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formulaire.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormulaireAdapter extends TypeAdapter<Formulaire> {
  @override
  final int typeId = 1;

  @override
  Formulaire read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Formulaire(
      fullName: fields[0] as String,
      civilitie: fields[1] as String,
      born: fields[2] as String,
      usager: fields[3] as String,
      location: fields[4] as String,
      cni: fields[5] as dynamic,
      acte: fields[6] as dynamic,
      email: fields[7] as String,
      number: fields[8] as String,
      region: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Formulaire obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.fullName)
      ..writeByte(1)
      ..write(obj.civilitie)
      ..writeByte(2)
      ..write(obj.born)
      ..writeByte(3)
      ..write(obj.usager)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.cni)
      ..writeByte(6)
      ..write(obj.acte)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.number)
      ..writeByte(9)
      ..write(obj.region);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormulaireAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
