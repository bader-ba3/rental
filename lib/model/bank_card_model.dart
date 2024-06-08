class BankCardModel {
  late String bankName, number, cvc, exp, type;
  BankCardModel({required this.bankName, required this.number, required this.type, required this.cvc, required this.exp});

  BankCardModel.fromJson(json) {
    bankName = json["bankName"];
    number = json["number"];
    cvc = json["cvc"];
    exp = json["exp"];
    type = json["type"];
  }

  Map toJson() {
    return {
      "bankName": bankName,
      "number": number,
      "type": type,
      "cvc": cvc,
      "exp": exp,
    };
  }
}