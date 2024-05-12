
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/Elevetedblue.dart';
import '../Widget/NavigationBar.dart';
import '../theme/theme_manager.dart';

class Parkingreceipt extends StatefulWidget {
  const Parkingreceipt({Key? key}) : super(key: key);

  @override
  State<Parkingreceipt> createState() => _ParkingreceiptState();
}

class _ParkingreceiptState extends State<Parkingreceipt> {

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
      backgroundColor: notifire.getreceiptcolor,
      appBar: AppBar(
        leading: BackButton(
          color:notifire.getwhiteblackcolor,
        ),
        automaticallyImplyLeading: true,
        backgroundColor:notifire.getreceiptcolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Parking Receipt',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: notifire.getwhiteblackcolor),
            ),
          ],
        ),
      ),
      // extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.02,
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 500,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color:notifire.getdarkmodecolor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/Rectangle58.png"),
                                        scale: 1,
                                        fit: BoxFit.cover),
                                    borderRadius:
                                        BorderRadius.circular(6),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Macquarie car parking Space",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 14,
                                          color:notifire.getwhiteblackcolor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    const Text(
                                      "This is the address",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 12,
                                          color: Color(0xff75788D),
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            const Divider(
                              color: Color(0xffE5E5E5),
                              thickness: 1,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Arrive",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 10,
                                          color: Color(0xff75788D),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    Text(
                                      "11.00",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 18,
                                          color: notifire.getwhiteblackcolor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
                                    const Text(
                                      "May, 24",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 10,
                                          color: Color(0xff75788D),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Image(
                                      image:
                                          const AssetImage('assets/Time.png'),
                                      color: notifire.getwhiteblackcolor,
                                      height: Get.height * 0.02,
                                      width: 138,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: const [
                                          Text(
                                            "Exit",
                                            style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 10,
                                                color:
                                                    Color(0xff75788D),
                                                fontWeight:
                                                    FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "13.30",
                                            style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 18,
                                                color:
                                                notifire.getwhiteblackcolor,
                                                fontWeight:
                                                    FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: Get.height * 0.01,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            "May, 24",
                                            style: TextStyle(
                                                fontFamily: 'Gilroy',
                                                fontSize: 10,
                                                color:
                                                    Color(0xff75788D),
                                                fontWeight:
                                                    FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: Color(0xffE5E5E5),
                              thickness: 1,
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Name",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 10,
                                          color: Color(0xff75788D),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Goku",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 12,
                                          color:notifire.getwhiteblackcolor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const Text(
                                      "Parking Pass",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 10,
                                          color: Color(0xff75788D),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "#23-56-76",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 12,
                                          color:notifire.getwhiteblackcolor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const Text(
                                      "Duration",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 10,
                                          color: Color(0xff75788D),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "#2.5 hours",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 12,
                                          color:notifire.getwhiteblackcolor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 80,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "Vehicle",
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 10,
                                              color: Color(0xff75788D),
                                              fontWeight:
                                                  FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Toyota Camry",
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 12,
                                              color:notifire.getwhiteblackcolor,
                                              fontWeight:
                                                  FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    const Text(
                                      "Parking Spot",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 10,
                                          color: Color(0xff75788D),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "#A-13 (F1)",
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 12,
                                              color: notifire.getwhiteblackcolor,
                                              fontWeight:
                                                  FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Row(
                                      children: const [
                                        Text(
                                          "Payment Method",
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 10,
                                              color: Color(0xff75788D),
                                              fontWeight:
                                                  FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Credit Card",
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 12,
                                              color:notifire.getwhiteblackcolor,
                                              fontWeight:
                                                  FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            const Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              child: DottedLine(
                                  direction: Axis.horizontal,
                                  lineLength: double.infinity,
                                  lineThickness: 1.0,
                                  dashColor: Color(0xffE5E5E5),
                                  // dashColor: Colors.black,
                                  dashGapLength: 4.0),
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            Image(
                                image:
                                    const AssetImage('assets/Bar Code.png'),
                            color: notifire.getwhiteblackcolor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  left: 4,
                  bottom: 95,
                  child: CircleAvatar(
                    backgroundColor: notifire.getreceiptcolor,
                  ),
                ),
                Positioned(
                  right: 4,
                  bottom: 95,
                  child: CircleAvatar(
                    backgroundColor: notifire.getreceiptcolor,
                  ),
                ),
               
              ],
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 8,vertical: 15),
              child: RoundeButtonblue(
                  btnName: 'Download Receipt',
                  textStyle: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                  callBack: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const BottomNav();
                      },
                    ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
