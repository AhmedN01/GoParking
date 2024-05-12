
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/NavigationBar.dart';
import '../signin-up/sign_in.dart';
import '../theme/theme_manager.dart';

class Onbording3 extends StatefulWidget {
  const Onbording3({Key? key}) : super(key: key);

  @override
  State<Onbording3> createState() => _Onbording3State();
}

class _Onbording3State extends State<Onbording3> {

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
      body: Column(
        children: [
          Container(
            height:Get.height*0.6,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Parking3.png'),fit: BoxFit.cover)),
          ),
          SizedBox(
            height:Get.height*0.03,
          ),
          Text(
            'Many Car Parking Space Available',
            style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color:notifire.getwhiteblackcolor),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          const Text(
            'Multiple parking spots',
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
            padding:  const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const BottomNav();
                      },));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                        fixedSize: const Size(156, 52),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                    ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return const Signin();
                      },));
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(156, 52),
                        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
                      backgroundColor: notifire.getblackwhitecolor,
                      side: const BorderSide(color: Color(0xff2378EF))
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff2378EF)
                      ),
                    ))
              ],
            ),
          ),

        ],
      ),
    );
  }
}
