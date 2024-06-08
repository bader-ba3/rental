import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rental/view/sign_in/add_license.dart';
import 'package:rental/view/sign_in/add_passport.dart';

import '../../utils/const.dart';
import '../auth/auth_screen.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Const.mainColor,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 250,),
         Expanded(
           child: Container(
             padding: EdgeInsets.all(16),
             width: double.infinity,
            decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(30)),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Text("Sign In To Your Account",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                 Text("Email:"),
                 SizedBox(height: 5,),
                 Container(
                     decoration: BoxDecoration(color: Colors.grey.shade100,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.black)),
                     width: double.infinity,
                     padding: EdgeInsets.symmetric(horizontal: 5),
                     height: 50,
                     child: TextFormField(decoration: InputDecoration(
                         hintText: "Email",
                         hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                         border: InputBorder.none),)),
                 SizedBox(height: 10,),
                 Text("Password:"),
                 SizedBox(height: 5,),
                 Container(
                     decoration: BoxDecoration(color: Colors.grey.shade100,borderRadius: BorderRadius.circular(15),border: Border.all(color: Colors.black)),
                     width: double.infinity,
                     padding: EdgeInsets.symmetric(horizontal: 5),
                     height: 50,
                     child: TextFormField(decoration: InputDecoration(
                         hintText: "Passord",
                         hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                         border: InputBorder.none),)),
                 SizedBox(height: 15,),
                 Row(
                   children: [
                     Spacer(),
                     Text("Forget Password",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                   ],
                 ),
                 SizedBox(height: 15,),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: InkWell(
                          onTap: (){
                            Get.to(()=>AddPassport());
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(color: Const.paigeColor,borderRadius: BorderRadius.circular(15)),
                            child: Center(child: Text("Sign In",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),)),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(color: Const.paigeColor,borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/UAEPASS.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                 SizedBox(height: 15,),
                 Row(
                   children: [
                     Spacer(),
                     Text("You Dont have Account?",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                     Text("Create Account",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Const.paigeColor),),
                     Spacer(),
                   ],
                 ),
                 SizedBox(height: 15,),
                 Row(
                   children: [
                     Expanded(child: Container(height: 2,color: Colors.black26,)),
                     SizedBox(width: 10,),
                     Text("OR"),
                     SizedBox(width: 10,),
                     Expanded(child: Container(height: 2,color: Colors.black26,)),
                   ],
                 ),

                 SizedBox(height: 15,),
                 AuthScreen(),
                 SizedBox(height: 15,),
               ],
             ),
           ),
         )
        ],
      ),
    );
  }
}
