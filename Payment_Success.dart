// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/Elevetedblue.dart';
import '../theme/theme_manager.dart';
import 'Parking_Receipt.dart';

class Paymentsuccess extends StatefulWidget {
  const Paymentsuccess({Key? key}) : super(key: key);

  @override
  State<Paymentsuccess> createState() => _PaymentsuccessState();
}

class _PaymentsuccessState extends State<Paymentsuccess> {

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
            SizedBox(
              height:Get.height*0.06
            ),
            Center(
              child: Container(
                height: 238.2,
                width: 280.78,
                decoration: const BoxDecoration(
                    // color: Colors.black,
                    image:
                        DecorationImage(image: AssetImage('assets/payment.png'))),
              ),
            ),
            SizedBox(
              height:Get.height*0.03 ,
            ),
            Text(
              'Payment Success!',
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: notifire.getwhiteblackcolor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height:Get.height*0.01 ,
            ),
            const Text(
              'This is Macquarie car park,\n parking',textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Gilroy',
                color: Color(0xff75788D),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height:Get.height*0.04 ,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 224,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: notifire.getdarkmodecolor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
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
                                    image: AssetImage("assets/Rectangle58.png"),
                                    scale: 1,
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Macquarie car parking Space",
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 14,
                                      color: notifire.getwhiteblackcolor,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 10,
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
                          height: Get.height*0.02,
                        ),
                        const Divider(
                          color: Color(0xffE5E5E5),
                          thickness: 1,
                        ),
                        SizedBox(
                          height: Get.height*0.02,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Subscription fee",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 12,
                                          color: Color(0xff75788D),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Tax fee",
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 12,
                                          color: Color(0xff75788D),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 80,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "\$13",
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 12,
                                            color:notifire.getwhiteblackcolor,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$0.2",
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 12,
                                              color:notifire.getwhiteblackcolor,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Get.height*0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Flex(
                                      // ignore: sort_child_properties_last
                                      children: List.generate(
                                        (constraints.constrainWidth() / 18).floor(),
                                            (index) => const SizedBox(
                                          height: 1,
                                          width: 10,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: Color(0xffE5E5E5),
                                            ),
                                          ),
                                        ),
                                      ),
                                      direction: Axis.horizontal,
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: Get.height*0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Total",
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 12,
                                              color: Color(0xff75788D),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 80,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "\$13.2",
                                          style: TextStyle(
                                              fontFamily: 'Gilroy',
                                              fontSize: 12,
                                              color:notifire.getselectbluewhite,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height*0.10,
            ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: RoundeButtonblue(
                  btnName: 'Continue',
                  textStyle: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                  callBack: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Parkingreceipt();
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
