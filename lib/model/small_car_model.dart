class SmallCarModel{
  String? id,status;
  SmallCarModel.fromJson(json){
    id=json['id'];
    status=json['status'];
  }

  toJson(){
    return {
      "id":id,
      "status":status,
    };
  }
}
