// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:my_app/Widget/Elevetedblue.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';
import 'Booking_Summary.dart';

class Bookingpage extends StatefulWidget {
  const Bookingpage({Key? key}) : super(key: key);

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  String? valuechoose;
  List listitem = [
    'Today | 9.30',
    'Tomorrow | 9.30',
    'yesterday | 9.30',
  ];
  String? exitchoose;
  List listitems = [
    'Today | 9.30',
    'Tomorrow | 9.30',
    'yesterday | 9.30',
  ];
  String? vehicalcar;
  List itemlist = [
    'Toyota Camry',
    'Toyota Corolla',
    'Mazda 3',
  ];
  String? selectarrive = 'Today | 9.30';
  String? exitarrive = 'Today | 9.30';
  String? vehical = 'Mazda 3';

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
          color:notifire.getwhiteblackcolor,
        ),
        automaticallyImplyLeading: true,
        // backgroundColor: Colors.cyanAccent,
        backgroundColor:notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Booking',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 176,
                    width: 327,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: notifire.getdarkmodecolor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
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
                                    "Macquarie car parking  Space",
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 14,
                                        color:notifire.getwhiteblackcolor,
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
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            color: Color(0xffE5E5E5),
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "This is the address",
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
                                    "#A-13 (F1)",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Fee",
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
                                        "\$5",
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 12,
                                            color:notifire.getwhiteblackcolor,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "/hours",
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 52,
              width: 327,
              decoration: BoxDecoration(
                  color: notifire.getdarkmodecolor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Arrive Before',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: Color(0xff75788D),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      iconSize: 30,
                      // isExpanded: true,
                      underline: const SizedBox(),
                      value: selectarrive,
                      onChanged: (newvalue) {
                        setState(() {
                          selectarrive = newvalue as String?;
                        });
                      },
                      items: listitem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Gilroy', fontSize: 13)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 52,
              width: 327,
              decoration: BoxDecoration(
                  color: notifire.getdarkmodecolor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Exit Before',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: Color(0xff75788D),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      iconSize: 30,
                      // isExpanded: true,
                      underline: const SizedBox(),
                      value: exitarrive,
                      onChanged: (newvalue) {
                        setState(() {
                          exitarrive = newvalue as String?;
                        });
                      },
                      items: listitems.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Gilroy', fontSize: 13)
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 52,
              width: 327,
              decoration: BoxDecoration(
                  color: notifire.getdarkmodecolor,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Vehicle',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        color: Color(0xff75788D),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      iconSize: 30,
                      // isExpanded: true,
                      underline: const SizedBox(),
                      value: vehical,
                      onChanged: (newvalue) {
                        setState(() {
                          vehical = newvalue as String?;
                        });
                      },
                      items: itemlist.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Gilroy', fontSize: 13)
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 136,
              width: 327,
              decoration: BoxDecoration(
                  color: notifire.getdarkmodecolor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
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
                      ),
                      const SizedBox(
                        width: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  const EdgeInsets.only(left: 7),
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
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: LayoutBuilder(
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\$13.2",
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 12,
                                      color: notifire.getselectbluewhite,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
              child: RoundeButtonblue(
                  btnName: 'Continue',
                  textStyle: const TextStyle(
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                  callBack: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const BookingSummary();
                    },));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
