import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cool_card_swiper/widgets/cool_swiper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rental/utils/hive.dart';
import 'package:rental/view/home_page/home_page_view.dart';
import 'package:rental/view/onboarding/onboarding.dart';

import '../../model/bank_card_model.dart';
import '../../utils/const.dart';
import 'card_field_formatter.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List bankCard=[];

  @override
  void initState() {
    bankCard = HiveDataBase.bankCardModelBox.values.toList();
    super.initState();
  }

  GlobalKey key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.mainColor,
      body:Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),
        child: Stack(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: Const.mainColor,
                child: Center(child: Text("aaaaa"),),
                height: 200,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 200,),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                            Text("Badr Aldin Almasri",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                            SizedBox(height: 25,),
                            Text("Number:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                            Text("+971562064458",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                            SizedBox(height: 25,),
                            Text("Id Number:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                            Text("123456789",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                            SizedBox(height: 25,),
                            Text("Driving License:",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                            Text("123456789",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                            SizedBox(height: 25,),
                            Row(
                              children: [
                                Text("Address",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                Spacer(),
                                InkWell(
                                    onTap: (){},
                                    child: CircleAvatar(radius: 20,backgroundColor: Const.mainColor,child: Icon(Icons.edit,color: Colors.white,),)),
                                SizedBox(width: 10,),
                              ],
                            ),
                            Text("UAE, Dubai, 16 Street",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w300),),
                            SizedBox(height: 25,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text("My Card",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                                    Spacer(),
                                    InkWell(
                                        onTap: () async {
                                          BankCardModel model = BankCardModel(bankName: "Almaria Bank", number: "", type: "", cvc: "", exp: "");
                                          BankCardModel? data = await showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                height: 350 + (MediaQuery.of(context).viewInsets.bottom),
                                                color: Const.mainColor,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: ListView(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Add New Card",
                                                            style: TextStyle(color: Colors.white, fontSize: 25),
                                                          ),
                                                          Spacer(),
                                                          IconButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              icon: Icon(
                                                                Icons.close,
                                                                color: Colors.white,
                                                              ))
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        "Card Number: ",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        height: 50,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          // color: Const.boxColor,
                                                          borderRadius: BorderRadius.circular(15),
                                                        ),
                                                        child: TextFormField(
                                                          style: TextStyle(color: Colors.white),
                                                          keyboardType: TextInputType.number,
                                                          inputFormatters: [
                                                            MaskedTextInputFormatter(
                                                              mask: 'xxxx-xxxx-xxxx-xxxx',
                                                              separator: '-',
                                                            ),
                                                          ],
                                                          decoration: InputDecoration(border: InputBorder.none, hintText: "  Enter your card number", hintStyle: TextStyle(color: Colors.white54)),
                                                          onChanged: (_) {
                                                            if (_.length == 19) {
                                                              model.number = _.split("-")[3];
                                                            }
                                                            if (_.startsWith("5") || _.startsWith("2")) {
                                                              model.type = "master_card";
                                                            } else {
                                                              model.type = "visa";
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "Expiry Date",
                                                                  style: TextStyle(color: Colors.white),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                  height: 50,
                                                                  width: double.infinity,
                                                                  decoration: BoxDecoration(
                                                                    // color: Const.boxColor,
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: TextFormField(
                                                                    style: TextStyle(color: Colors.white),
                                                                    inputFormatters: [
                                                                      MaskedTextInputFormatter(
                                                                        mask: 'xx/xx',
                                                                        separator: '/',
                                                                      ),
                                                                    ],
                                                                    keyboardType: TextInputType.datetime,
                                                                    decoration: InputDecoration(border: InputBorder.none, hintText: "  MM/YY", hintStyle: TextStyle(color: Colors.white54)),
                                                                    onChanged: (_) {
                                                                      model.exp = _;
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 20,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text(
                                                                  "Security Code",
                                                                  style: TextStyle(color: Colors.white),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Container(
                                                                  height: 50,
                                                                  width: double.infinity,
                                                                  decoration: BoxDecoration(
                                                                    //  color: Const.boxColor,
                                                                    borderRadius: BorderRadius.circular(15),
                                                                  ),
                                                                  child: TextFormField(
                                                                    style: TextStyle(color: Colors.white),
                                                                    inputFormatters: [
                                                                      MaskedTextInputFormatter(
                                                                        mask: 'xxx',
                                                                        separator: '',
                                                                      ),
                                                                    ],
                                                                    keyboardType: TextInputType.number,
                                                                    decoration: InputDecoration(border: InputBorder.none, hintText: "  CCV", hintStyle: TextStyle(color: Colors.white54)),
                                                                    onChanged: (_) {
                                                                      model.cvc = _;
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 25,
                                                      ),
                                                      TextButton(
                                                          style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(Const.paigeColor)),
                                                          onPressed: () {
                                                            Get.back(result: model);
                                                          },
                                                          child:Text( "Add Card")),
                                                      SizedBox(
                                                        height: (MediaQuery.of(context).viewInsets.bottom),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          if (data != null) {
                                            if(data.number.isNotEmpty&&data.type.isNotEmpty&&data.bankName.isNotEmpty&&data.cvc.isNotEmpty&&data.exp.isNotEmpty){
                                              HiveDataBase.bankCardModelBox.put(data.number+data.cvc, data);
                                              bankCard.add(data);
                                              key = GlobalKey();
                                              setState(() {});
                                            }
                                          }
                                        },
                                        child: CircleAvatar(radius: 20,backgroundColor: Const.mainColor,child: Icon(Icons.add,color: Colors.white,),)),
                                    SizedBox(width: 10,),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                if (bankCard.isNotEmpty)
                                  SizedBox(
                                    height: 250,
                                    child: bankCard.length == 1
                                        ? cardWidget(bankCard.first)
                                        : CoolSwiper(
                                      key: key,
                                      children: bankCard.map((e) => cardWidget(e)).toList(),
                                    ),
                                  )
                                else
                                  SizedBox(
                                    height: 250,
                                    child: Center(
                                      child: Text("You have not added a bank card yet",style: TextStyle(color: Colors.red,fontSize: 20),),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 25,),
                            Center(
                              child: InkWell(
                                onTap: (){
                                  Get.offAll(()=>HomePageView(isUser:false));
                                },
                                child: Container(
                                  height: 60,
                                  width:MediaQuery.sizeOf(context).width/1.1,
                                  decoration: BoxDecoration(color: Const.paigeColor,borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text("provider mode",style: TextStyle(color: Colors.white,fontSize: 22),),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            Center(
                              child: InkWell(
                                onTap: (){
                                  HiveDataBase.deleteUserData();
                                  Get.offAll(()=>OnboardingView());
                                },
                                child: Container(
                                  height: 60,
                                  width:MediaQuery.sizeOf(context).width/1.1,
                                  decoration: BoxDecoration(color: Const.paigeColor,borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text("Sign Out",style: TextStyle(color: Colors.white,fontSize: 22),),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 25,),
                            Center(
                              child: InkWell(
                                onTap: (){
                                  HiveDataBase.deleteUserData();
                                  Get.offAll(()=>OnboardingView());
                                },
                                child: Container(
                                  height: 60,
                                  width:MediaQuery.sizeOf(context).width/1.1,
                                  decoration: BoxDecoration(color: Const.secColor,borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text("Delete Account",style: TextStyle(color: Colors.white,fontSize: 22),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                top: 75,
                left: 0,
                right: 0,
                child:  Center(
                  child: CircleAvatar(radius: 75,
                    backgroundColor: Const.paigeColor,
                    child: Icon(Icons.person,color: Colors.white,size: 100,),),
                )),
          ],
        ),
      )
    );
  }
  Widget cardWidget(BankCardModel model) {
    return SizedBox(
      height: 250,
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration( color: model.type =="visa"?Colors.blue.shade900:Colors.black,borderRadius: BorderRadius.circular(15)),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/card/${model.type}.png",
                    // colorBlendMode: model.type =="Visa"?(Colors.blueAccent):null,
                    height: 40,
                  ),
                  // Text(
                  //   HiveDataBase.getUserData().name,
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  // Text(
                  //   model.bankName,
                  //   style: TextStyle(color: Colors.white60),
                  // ),
                  Spacer(flex: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "****",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        "****",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        "****",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      Text(
                        model.number,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "EXP",
                            style: TextStyle(color: Colors.white60, fontSize: 13),
                          ),
                          Text(
                            model.exp,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(width: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Security Code",
                            style: TextStyle(color: Colors.white60, fontSize: 13),
                          ),
                          Text(
                            "***",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
class CustomClipPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    final path = Path();
    path.lineTo(0, h);
    path.quadraticBezierTo(w*0.5, h-100, w, h );
    path.lineTo(w, 0);
    path.close();



    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}
