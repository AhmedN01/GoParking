// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/Elevetedblue.dart';
import '../Widget/custom_widget.dart';
import '../theme/theme_manager.dart';

class Addvehical extends StatefulWidget {
  const Addvehical({Key? key}) : super(key: key);

  @override
  State<Addvehical> createState() => _AddvehicalState();
}

class _AddvehicalState extends State<Addvehical> {

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
    return   Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor:notifire.getbgcolor,
        leading: BackButton(
          color: notifire.getwhiteblackcolor,
        ),
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Edit Vehicle',
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
        child: Column(children: [
          SizedBox(
            height: Get.height * 0.02,
          ),
          customformtextfild(
              style: TextStyle(color: notifire.getwhiteblackcolor),
              labeltext: 'Vehicle Type',
              labelstyle:const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff75788D))),
          SizedBox(
            height: Get.height * 0.02,
          ),
          customformtextfild(
              style: TextStyle(color: notifire.getselectbluewhite),
              labeltext: 'Lisence Plat Number',
              labelstyle:const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff75788D))),
          SizedBox(
            height: Get.height * 0.02,
          ),
          customformtextfild(
              style: TextStyle(color: notifire.getwhiteblackcolor),
              labeltext: 'Car Model',
              labelstyle:const TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Color(0xff75788D))),
          SizedBox(
            height: Get.height * 0.4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: RoundeButtonblue(
                btnName: 'Save',
                textStyle: const TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
                callBack: () {
                  Navigator.pop(context);
                }),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          customelevated(
              btnname: const Text(
                'Cancel',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 14,
                    color: Color(0xffE53935),
                    fontWeight: FontWeight.w700),
              ),
              bgcolor:notifire.getdarkscolor,
              side: const BorderSide(width:3,color: Color(0xffE53935)),
              callBack: () {
                Navigator.pop(context);
                return null;
              }),
        ]),
      ),
    );
  }
}
