// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/intro/onbording1.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Spleshscreen extends StatefulWidget {
  const Spleshscreen({Key? key}) : super(key: key);

  @override
  State<Spleshscreen> createState() => _SpleshscreenState();
}

class _SpleshscreenState extends State<Spleshscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const Onbording1();
          }));
    });
    // check_if_already_login();
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  late SharedPreferences logindata;
  late bool newuser;

  // void check_if_already_login() async {
  //   logindata = await SharedPreferences.getInstance();
  //   newuser = (logindata.getBool('login') ?? true);
  //   print(newuser);
  //   if (newuser == false) {
  //     getData.read("Firstuser") != true;
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return onbording1();
  //         },
  //       ),
  //     );
  //   }if(newuser == true){
  //     Navigator.push(context, MaterialPageRoute(
  //         builder: (context) {
  //           return onbording1();
  //         }));
  //   }
  // }
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   EmailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width:double.infinity,
      decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: AssetImage('assets/backs.png'),fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 101.2,
                width: 83,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(image: AssetImage('assets/parkinglogo.png'),fit: BoxFit.cover),
                ),
                child: InkWell(
                  onTap: (){

                    // loginapi();
                  },
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: Get.height * 0.02),
              const Center(
                child: Text(
                  'GoParking',
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }
  ///login Api///
  // loginapi() {
  //   var data = {
  //     "mobile": EmailController.text.toString(),
  //     "password": passwordController.text.toString(),
  //   };
  //   // ApiWrapper.dataPost("rider_login.php", data);
  //   ApiWrapper.dataPost(AppUrl.login, data).then((val) {
  //     if ((val != null) && (val.isNotEmpty)) {
  //       // print(val);
  //       if ((val['ResponseCode'] == "200") && (val['Result'] == "true")) {
  //         // save("Firstuser", true);
  //         setState(() {
  //           save("user", val["user"]);
  //           print("Result${getData.read("user")}");
  //           print("Result${getData.read("user")}");
  //           ApiWrapper.showToastMessage(val["ResponseMsg"]);
  //         });
  //         if (EmailController != '' && passwordController != '') {
  //           print('Successfull');
  //           logindata.setBool('login', false);
  //           logindata.setString('mobile', passwordController.text);
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) {
  //                 return BottomNav();
  //               },
  //             ),
  //           );
  //         }
  //
  //       } else {
  //         ApiWrapper.showToastMessage(val["ResponseMsg"]);
  //       }
  //     }
  //   });
  // }
}

