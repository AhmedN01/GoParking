// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/signin-up/sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/Elevetedblue.dart';
import '../theme/theme_manager.dart';
import 'Otpverification.dart';


class Cnewpassword extends StatefulWidget {
  const Cnewpassword({Key? key}) : super(key: key);

  @override
  State<Cnewpassword> createState() => _CnewpasswordState();
}

class _CnewpasswordState extends State<Cnewpassword> {
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }
  late ColorNotifire notifire;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdarkmodepreviousstate();
  }

  // void _toggleVisibility() {
  //   setState(() {
  //     _showPassword = !_showPassword;
  //   });
  // }
  TextEditingController loginController = TextEditingController();
  TextEditingController  confirmController = TextEditingController();
  //bool _showPassword = true;

  bool hiddenNewpassword = true;
  bool hiddenpassword = true;
  bool check=false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height:Get.height*0.09,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create New Password',
                    style: TextStyle(
                        fontSize: 18,
                        color:  notifire.getwhiteblackcolor,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Verificatione();
                        },
                      ));
                    },
                    child: const Text(
                      'Cancel',
                      style:
                      TextStyle(fontSize: 12, color: Color(0xffE53935)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left:15),
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                        'Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt',
                        style: TextStyle(
                            color: Color(0xff75788D),
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
            SizedBox(
              height:Get.height*0.05,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                style: TextStyle(color:  notifire.getwhiteblackcolor),
                controller: loginController,
                obscureText: hiddenNewpassword,
                decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(fontFamily: 'Gilroy', color: Color(0xff75788D)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hiddenNewpassword = !hiddenNewpassword;
                        });
                      },
                      icon: hiddenNewpassword
                          ? Icon(Icons.visibility_off_outlined,  color:  notifire.getwhiteblackcolor)
                          : Icon(Icons.visibility_outlined,  color:  notifire.getwhiteblackcolor),
                    )),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please a Enter Password';
                //   }
                //   return null;
                // },
              ),
            ),
            SizedBox(
              height:Get.height*0.02,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                style: TextStyle(color:  notifire.getwhiteblackcolor),
                controller: confirmController,
                obscureText: hiddenpassword,
                decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.grey),
                    ),
                    labelText: 'Confirm Password',
                    labelStyle: const TextStyle(fontFamily: 'Gilroy', color: Color(0xff75788D)),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hiddenpassword = !hiddenpassword;
                        });
                      },
                      icon: hiddenpassword
                          ? Icon(Icons.visibility_off_outlined, color:  notifire.getwhiteblackcolor)
                          : Icon(Icons.visibility_outlined, color:  notifire.getwhiteblackcolor),
                    )),
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return 'Please re-enter password';
                //   }
                //   print(loginController.text);
                //   print(confirmController.text);
                //   if (loginController.text !=
                //       confirmController.text) {
                //     return "Password does not match";
                //   }
                //   return null;
                // },
              ),
            ),
            SizedBox(
              height:Get.height*0.05,
            ),
            RoundeButtonblue(
              btnName: 'Continue',
              bgColor: const Color(0xff2378EF),
              textStyle: const TextStyle(fontSize: 14),
              callBack: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Signin();
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
