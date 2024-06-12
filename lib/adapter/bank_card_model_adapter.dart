import 'package:hive_flutter/hive_flutter.dart';
import 'package:rental/model/bank_card_model.dart';


class BankCardModelAdapter extends TypeAdapter<BankCardModel>{
  @override
  BankCardModel read(BinaryReader reader) {
    return BankCardModel.fromJson(reader.read());
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, BankCardModel obj) {
   writer.write(obj.toJson());
  }
}