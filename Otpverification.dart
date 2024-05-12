// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Widget/Elevetedblue.dart';
import 'package:my_app/signin-up/Create_New_Password.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';
import 'Forget_password.dart';

class Verificatione extends StatefulWidget {
  const Verificatione({Key? key}) : super(key: key);

  @override
  State<Verificatione> createState() => _VerificationeState();
}

class _VerificationeState extends State<Verificatione> {
  OtpFieldController otpController = OtpFieldController();

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
      backgroundColor: notifire.getbgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.09,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'OTP Verification',
                    style: TextStyle(
                        fontSize: 18,
                        color: notifire.getwhiteblackcolor,
                        fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Forgetpassword();
                        },
                      ));
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 12, color: Color(0xffE53935)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 24,
              ),
              child: RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'We’ve just send you 4 digits code to your email',
                        style: TextStyle(
                            color: Color(0xff75788D),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: ' example@example.com',
                        style: TextStyle(
                            color: Color(0xff75788D),
                            fontSize: 13,
                            fontWeight: FontWeight.w800)),
                    // TextSpan(text: ' world!'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            OTPTextField(
              controller: otpController,
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 60,
              fieldStyle: FieldStyle.underline,
              otpFieldStyle: OtpFieldStyle(
                  enabledBorderColor: Colors.grey,
                  focusBorderColor: Colors.grey //(here)
                  ),
              style:
                  TextStyle(fontSize: 17, color: notifire.getwhiteblackcolor),
            ),
            SizedBox(
              height: Get.height * 0.06,
            ),
            RoundeButtonblue(
              btnName: 'Continue',
              bgColor: const Color(0xff2378EF),
              textStyle: const TextStyle(fontSize: 14),
              callBack: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const Cnewpassword();
                  },
                ));
              },
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: "Didn’t received the code?",
                    style: TextStyle(color: Color(0xff75788D), fontSize: 12)),
                WidgetSpan(
                    child: GestureDetector(
                  child: const Text(
                    ' Resend Code',
                    style: TextStyle(
                        color: Color(0xff2378EF),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  onTap: () {},
                ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
