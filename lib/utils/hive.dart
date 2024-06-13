import 'package:hive_flutter/hive_flutter.dart';
import 'package:rental/adapter/bank_card_model_adapter.dart';
import 'package:rental/model/bank_card_model.dart';

class HiveDataBase {
  static late Box<String> accountBox;
  static late Box<BankCardModel> bankCardModelBox;
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(BankCardModelAdapter());

    accountBox=await Hive.openBox<String>("Account");
    bankCardModelBox=await Hive.openBox<BankCardModel>("AllBankCard");

  }
  static ({String name,String gender,String email,String mobile,String licenseImage,String passport,String location}) getUserData(){
     String mobile = accountBox.get("mobile").toString();
     String name = accountBox.get("name").toString();
     String gender =accountBox.get("gender").toString();
     String email =accountBox.get("email").toString();
     String licenseImage =accountBox.get("licenseImage").toString();
     String passport =accountBox.get("passport").toString();
     String location =accountBox.get("location").toString();

     return (name: name,gender: gender,email: email,mobile:mobile,licenseImage:licenseImage,passport:passport,location:location);
  }

  static  setUserData(({String name,String gender,String email,String mobile}) data)async{
    await accountBox.put("mobile",data.mobile);
    await accountBox.put("name",data.name);
    await accountBox.put("gender",data.gender);
    await accountBox.put("email",data.email);
     return true;
  }

  static  setUserPassPortData(String passport)async{
    await accountBox.put("passport",passport);
    return true;
  }
  static  setUserLocationData(String location)async{
    await accountBox.put("location",location);
    return true;
  }
  static  setUserLicenseImageData(String licenseImage)async{
    await accountBox.put("licenseImage",licenseImage);
    return true;
  }
  static  deleteUserData(){
    accountBox.delete("mobile");
    accountBox.delete("name");
    accountBox.delete("gender");
    accountBox.delete("email");
    accountBox.delete("licenseImage");
    accountBox.delete("passport");
  }


}