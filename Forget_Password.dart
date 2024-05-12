// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/signin-up/sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/Elevetedblue.dart';
import '../theme/theme_manager.dart';
import 'Otpverification.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  bool hiddenpassword = true;

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

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor:notifire.getbgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(
              top: 64,
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                        fontSize: 18,
                        color:notifire.getwhiteblackcolor,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Signin();
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
              padding: const EdgeInsets.only(left: 24,),
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text:
                            'Input your linked email to your Parken account below, we’ll send you a link to change your password',
                        style: TextStyle(
                            color: Color(0xff75788D),
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),

                    // TextSpan(text: ' world!'),
                  ],
                ),
              ),
            ),
             SizedBox(
              height: Get.height*0.05,
            ),
            Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextField(
                    style: TextStyle(color:  notifire.getwhiteblackcolor),
                    obscureText: hiddenpassword,
                    decoration: InputDecoration(
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.grey),
                        ),
                        labelText: 'Enter Number',
                        labelStyle: const TextStyle(fontFamily: 'Gilroy', color:Colors.grey),
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            hiddenpassword =!hiddenpassword;
                          });
                        }, icon:hiddenpassword ? Icon(Icons.visibility_off_outlined,color: notifire.getwhiteblackcolor)
                            : Icon(Icons.visibility_outlined,color: notifire.getwhiteblackcolor,),
                        )
                  ),
                ),
                )
              ],
            )),
             SizedBox(
               height: Get.height*0.06,
            ),
            RoundeButtonblue(
              btnName: 'Continue',
              bgColor: const Color(0xff2378EF),
              textStyle: const TextStyle(fontSize: 14),
              callBack: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Verificatione();
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
