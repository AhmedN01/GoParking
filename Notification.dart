// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';

class Notificatione extends StatefulWidget {
  const Notificatione({Key? key}) : super(key: key);

  @override
  State<Notificatione> createState() => _NotificationeState();
}

class _NotificationeState extends State<Notificatione> {
  List<Items> item = [
    Items(
      id: 0,
      title: "Discount Available",
      image: "assets/discount.png",
      subtitle:
          "We recommend a 10% discount for parking\n around West 3.",
    ),
    Items(
      id: 1,
      title: "You have 15 minutes left!",
      image: "assets/timeleft.png",
      subtitle: "You should check out from West 5 at\n13.30",
    ),
  ];
  List<Items> item1 = [
    Items(
      id: 0,
      title: "Payment Success!",
      image: "assets/psuccess.png",
      subtitle: "Your payment for West 5 at 09.12 \n successful.",
    ),
    Items(
      id: 1,
      title: "Payment Failed",
      image: "assets/pfailed.png",
      subtitle:
          "Your payment failed, please check you internet \n connection and try again.0",
    ),
    Items(
      id: 2,
      title: "You have 15 minutes left!",
      image: "assets/carleft.png",
      subtitle: "You should check out from the West 4\n Park at 15.00",
    ),
    Items(
      id: 3,
      title: "You have 15 minutes left!",
      image: "assets/scooterleft.png",
      subtitle: "You should check out from West 2\n at 19.00",
    ),
  ];

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
        automaticallyImplyLeading: true,
        leading: BackButton(
          color: notifire.getwhiteblackcolor,
        ),
        backgroundColor:notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Notifications',
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Text('Today',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: Color(0xffACAEBE),
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                width: 330,
                decoration: BoxDecoration(
                  //   color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                margin: const EdgeInsets.only(bottom: 15),
                                color:  notifire.getdarkmodecolor,
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          //color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${item[index].image}"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 16,
                                                  width: 140,
                                                  child: Text(
                                                    "${item[index].title}",
                                                    style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 14,
                                                        color: notifire.getwhiteblackcolor,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets.only(
                                                          left: 25, top: 5),
                                                      height: 14,
                                                      width: 55,
                                                      child: const Text(
                                                        '3 hours ago',
                                                        style: TextStyle(
                                                            fontFamily: 'Gilroy',
                                                            fontSize: 10,
                                                            color:
                                                                Color(0xffACAEBE),
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "${item[index].subtitle}",
                                                style: const TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 9.6,
                                                    color: Color(0xff75788D),
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                )),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Text('YESTERDAY',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    color: Color(0xffACAEBE),
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ),
          SizedBox(
            height:Get.height*0.02 ,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                width: 330,
                decoration: BoxDecoration(
                  //   color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                margin: const EdgeInsets.only(bottom: 15),
                                color: notifire.getdarkmodecolor,
                                elevation: 0.2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          // color:notifire.getwhiteblackcolor,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${item1[index].image}"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 16,
                                                  width: 140,
                                                  child: Text(
                                                    "${item1[index].title}",
                                                    style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 14,
                                                        color: notifire.getwhiteblackcolor,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets.only(
                                                          left: 25, top: 5),
                                                      height: 14,
                                                      width: 55,
                                                      child: const Text(
                                                        '3 hours ago',
                                                        style: TextStyle(
                                                            fontFamily: 'Gilroy',
                                                            fontSize: 10,
                                                            color:
                                                                Color(0xffACAEBE),
                                                            fontWeight:
                                                                FontWeight.w400),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(top: 5),
                                              child: Text(
                                                "${item1[index].subtitle}",
                                                style: const TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    fontSize: 9.6,
                                                    color: Color(0xff75788D),
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                )),
          ),
        ]),
      ),
    );
  }
}

///row
// Row(
//   children: [
//     Expanded(
//       child: Card(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Container(
//           height: 85,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(left: 16),
//                 child: Container(
//                   width: 50,
//                   height: 52,
//                   decoration: BoxDecoration(
//                     // color: Colors.white,
//                     image: DecorationImage(
//                         image: AssetImage(
//                             "${Item[index].image}"),
//                         fit: BoxFit.cover),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                         padding:  EdgeInsets.symmetric(horizontal:8,vertical: 16),
//                         child: Container(
//                           width: 140,
//                           child: Text(
//                             "${Item[index].title}",
//                             style: TextStyle(
//                                 fontFamily: 'Gilroy',
//                                 fontSize: 12,
//                                 color: Color(0xff000000),
//                                 fontWeight:
//                                     FontWeight.w700),
//                           ),
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(left: 20),
//                             height: 14,
//                             width: 55,
//                             child: Text(
//                               '3 hours ago',
//                               style: TextStyle(
//                                   fontFamily: 'Gilroy',
//                                   fontSize: 10,
//                                   color: Color(0xffACAEBE),
//                                   fontWeight:
//                                       FontWeight.w400),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
///
class Items {
  int? id;
  String? title;
  String? subtitle;
  String? image;

  Items({
    this.id,
    this.title,
    this.subtitle,
    this.image,
  });
}

class Items1 {
  int? id;
  String? title;
  String? subtitle;
  String? image;

  Items1({
    this.id,
    this.title,
    this.subtitle,
    this.image,
  });
}
