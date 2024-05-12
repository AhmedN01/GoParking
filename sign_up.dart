// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/signin-up/sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/Elevetedblue.dart';
import '../Widget/formtextfield.dart';
import '../theme/theme_manager.dart';
import 'ADD_PHOTO_PROFILE.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({Key? key}) : super(key: key);

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {

  late String name,email,phone;
  final _formKey = GlobalKey<FormState>();

  final loginController = TextEditingController();
  final confirmController = TextEditingController();


  TextEditingController emailss = TextEditingController();
  TextEditingController namess = TextEditingController();
  TextEditingController date = TextEditingController();

  late SharedPreferences pref;
  late ColorNotifire notifire;

  @override
  void initState() {
    initprefrences();
    super.initState();
    getdarkmodepreviousstate();
  }

  // void _toggleVisibility() {
  //   setState(() {
  //     _showPassword = !_showPassword;
  //   });
  // }

  bool hiddenNewpassword = true;
  bool hiddenpassword = true;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor:notifire.getbgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height*0.09,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sign Up',
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
              padding: const EdgeInsets.only(left: 5, right: 35),
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'By click the sign up button, you’re agree to ',
                        style: TextStyle(
                            color: Color(0xff75788D),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                              text: 'Parken’s\n',
                              style: TextStyle(
                                  color: Color(0xff75788D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                          TextSpan(
                              text: 'Terms and Service',
                              style: TextStyle(
                                  color: Color(0xff75788D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                          TextSpan(text: 'and acknlowledge the'),
                          TextSpan(
                              text: ' Privacy and\n Policy',
                              style: TextStyle(
                                  color: Color(0xff75788D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                        ]),
                  ],
                ),
              ),
            ),
             SizedBox(
              height: Get.height*0.03,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 24)),
                    CommonTextField(
                      textEditingController:emailss,
                      labelText: 'Email',
                      textStyle: TextStyle(color: notifire.getwhiteblackcolor),
                    ),
                     SizedBox(
                      height: Get.height*0.01,
                    ),
                    CommonTextField(
                      textEditingController:namess,
                      labelText: 'Name',
                      textStyle: TextStyle(color: notifire.getwhiteblackcolor),
                    ),
                    SizedBox(
                      height: Get.height*0.01,
                    ),
                    CommonTextField(
                      textStyle: TextStyle(color: notifire.getselectbluewhite),
                      textEditingController: date,
                      labelText: 'Birth Date',
                    ),
                    SizedBox(
                      height: Get.height*0.01,
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
                      height: Get.height*0.01,
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
                      height: Get.height*0.02,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Transform.scale(
                            scale: 0.9,
                            child: Checkbox(
                              value: check,
                              side: BorderSide(color:notifire.getwhiteblackcolor),
                              activeColor: const Color(0xff1CBE8E),
                              shape: const CircleBorder(),
                              onChanged: (newbool) {
                                setState(() {
                                  check = newbool!;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 15),
                          child: Text(
                            "Password must be at least 8 character, uppercase, lowercase,\n"
                            " and unique code like #%!",
                            style: TextStyle(
                                fontSize: 10.5,
                                color:notifire.getwhiteblackcolor,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: Get.height*0.3/2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: SizedBox(
                height: 52,
                width: 327,
                child: RoundeButtonblue(
                  btnName: 'Sign Up',
                  bgColor: const Color(0xff2378EF),
                  textStyle: const TextStyle(fontSize: 14),
                  callBack: () async {
                    if (_formKey.currentState!.validate()) {

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Addphoto();
                          //return BottomNav();
                        },
                      ));
                    } else {
                    }
                    // final prefs = await SharedPreferences.getInstance();
                    // final String? lemail = prefs.getString('email');
                    // final String? lpassword = prefs.getString('password');
                    // if (lemail == Email.text && lpassword == loginController.text) {
                    //   await  Navigator.push(context, MaterialPageRoute(
                    //     builder: (context) {
                    //       return BottomNav();
                    //     },
                    //   ));
                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return addphoto();
                    //   },
                    // ));
                    //}
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> initprefrences() async {
    pref = await SharedPreferences.getInstance();
  }
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

}
