class SmallCarModel{
  String? id,status,reason;
  SmallCarModel.fromJson(json){
    id=json['id'];
    status=json['status'];
    reason=json['reason'];
  }

  toJson(){
    return {
      "id":id,
      "reason":reason,
      "status":status,
    };
  }
}
