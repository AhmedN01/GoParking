// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/Elevetedblue.dart';
import '../theme/theme_manager.dart';
import 'Add_Credit_Card.dart';

class Choosepayment extends StatefulWidget {
  const Choosepayment({Key? key}) : super(key: key);

  @override
  State<Choosepayment> createState() => _ChoosepaymentState();
}

class _ChoosepaymentState extends State<Choosepayment> {
  bool selectedmaster = true;
  bool selectedpaypal = false;

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
              'Choose Payment',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: notifire.getwhiteblackcolor),
            ),
          ],
        ),
      ),
      backgroundColor: notifire.getbgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Container(
                height: 72,
                width: 327,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: BorderSide(
                            color: selectedmaster
                                ? notifire.getselectbluewhite
                                : Colors.transparent),
                        backgroundColor: notifire.getdarkmodecolor),
                    onPressed: () {
                      selectedmaster = !false;
                      selectedpaypal = !true;
                      setState(() {});
                    },
                    child: ListTile(
                      leading: const Image(
                        image: AssetImage('assets/mastercard.png'),
                        height: 32,
                        width: 32,
                      ),
                      title: Text(
                        'Mastercard',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: notifire.getwhiteblackcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: const Text(
                        'XXXX - XXXX  - 0937',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Color(0xff75788D),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 72,
                width: 327,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: BorderSide(
                            color: selectedpaypal
                                ? notifire.getselectbluewhite
                                : Colors.transparent),
                        backgroundColor: notifire.getdarkmodecolor),
                    onPressed: () {
                      selectedmaster = !true;
                      selectedpaypal = !false;
                      setState(() {});
                    },
                    child: ListTile(
                      leading: const Image(
                        image: AssetImage('assets/paypal.png'),
                        height: 32,
                        width: 32,
                      ),
                      title: Text(
                        'Paypal',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: notifire.getwhiteblackcolor,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: const Text(
                        'Connect your paypal account',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          color: Color(0xff75788D),
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Addcredicard();
                      },
                    ));
                  },
                  child: const Text(
                    'Add Credit Card',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Color(0xff2378EF),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Addcredicard();
                      },
                    ));
                  },
                  child: const Image(
                    image: AssetImage('assets/plus.png'),
                    height: 18,
                    width: 18,
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.43,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: RoundeButtonblue(
                  btnName: 'Pay \$13.2',
                  textStyle: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                  callBack: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Addcredicard();
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
