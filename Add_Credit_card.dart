// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/MAIN_PAGE/Payment_Success.dart';
import 'package:my_app/Widget/Elevetedblue.dart';
import 'package:my_app/Widget/custom_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';

class Addcredicard extends StatefulWidget {
  const Addcredicard({Key? key}) : super(key: key);

  @override
  State<Addcredicard> createState() => _AddcredicardState();
}

class _AddcredicardState extends State<Addcredicard> {

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
      appBar: AppBar(
        leading: BackButton(
          color: notifire.getwhiteblackcolor,
        ),
        automaticallyImplyLeading: true,
        // backgroundColor: Colors.cyanAccent,
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Add Credit Card',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color:notifire.getwhiteblackcolor),
            ),
          ],
        ),
      ),
      backgroundColor:notifire.getbgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            customformtextfild(
                style: TextStyle(color:notifire.getwhiteblackcolor),
                labeltext: 'Name',
                labelstyle:const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff75788D))),
            const SizedBox(
              height: 20,
            ),
            customformtextfild(
              style: TextStyle(color:notifire.getselectbluewhite),
                labeltext: 'Card Number',
                labelstyle:const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff75788D))),
            const SizedBox(
              height: 20,
            ),
            customformtextfild(
                style: TextStyle(color:notifire.getwhiteblackcolor),
                labeltext: 'Expired Date',
                labelstyle:const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff75788D))),
            const SizedBox(
              height: 20,
            ),
            customformtextfild(
                style: TextStyle(color:notifire.getwhiteblackcolor),
                labeltext: 'CVV',
                labelstyle:const TextStyle(
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff75788D))),
            SizedBox(
              height: Get.height*0.39,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: RoundeButtonblue(
                  btnName: 'Add Card',
                  textStyle: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                  callBack: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Paymentsuccess();
                      },
                    ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
