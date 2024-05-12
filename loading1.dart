// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Widget/Elevetedblue.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme/theme_manager.dart';
import 'loading2.dart';

class Onbording1 extends StatefulWidget {
  const Onbording1({Key? key}) : super(key: key);

  @override
  State<Onbording1> createState() => _Onbording1State();
}

class _Onbording1State extends State<Onbording1> {

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
      body: Column(
        children: [
          Container(
            height:Get.height*0.6,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Parking1.png'),fit: BoxFit.cover)),
          ),
          SizedBox(
            height: Get.height * 0.03,
          ),
          Text(
            'Best parking space In the University',
            style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: notifire.getwhiteblackcolor),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          const Text(
            'Parking space for Students & Staff !',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xff75788D)),
          ),
          SizedBox(
            height: Get.height * 0.3/2,
          ),
          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: RoundeButtonblue(
                btnName: 'Continue',
                textStyle: const TextStyle(
                  fontFamily: 'Gilroy',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                callBack: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Onbording2();
                  },));
                }),
          )
        ],
      ),

    );
  }
}