// ignore_for_file: file_names
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/MAIN_PAGE/Booking.dart';
import 'package:my_app/Widget/Elevetedblue.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';

class Pickparking extends StatefulWidget {
  const Pickparking({Key? key}) : super(key: key);

  @override
  State<Pickparking> createState() => _PickparkingState();
}

class _PickparkingState extends State<Pickparking> {

  bool image= false;

  bool car0 = false;
  bool car1 = false;
  bool car2 = false;
  bool car3 = false;

  bool carb0 = false;
  bool carb1 = false;
  bool carb2 = false;
  bool carb3 = false;

  bool carc0 = false;
  bool carc1 = false;
  bool carc2 = false;
  bool carc3 = false;

  String? valuechoose;
  List listitem = [
    '1st Floor',
    '2st Floor',
    '3st Floor',
    '4st Floor',
    '5st Floor',
  ];
  String? dates = '1st Floor';

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
        leading:  BackButton(
          color: notifire.getwhiteblackcolor,
        ),
        automaticallyImplyLeading: true,
        // backgroundColor: Colors.cyanAccent,
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:  [
            Text(
              'Choose Spot',
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color:notifire.getwhiteblackcolor),
            ),
          ],
        ),
      ),
      backgroundColor: notifire.getbgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // color: Colors.red,
              height: 20,
              width: 83,
              child: DropdownButton(
                borderRadius: BorderRadius.circular(10),
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                iconSize: 22,
                // isExpanded: true,
                underline: const SizedBox(),
                value: dates,
                onChanged: (newvalue) {
                  setState(() {
                    dates = newvalue as String?;
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
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                SizedBox(
                  height: 170,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 9),
                        child: DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1.0,
                            dashColor: Color(0xffACAEBE),
                            dashGapLength: 4.0),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                car0 = true;
                                car1 = false;
                                car2 = false;
                                car3 = false;
                                 image= false;
                              });
                            },
                            child: SizedBox(
                              height: 150,
                              width: 88,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      height: 23,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: car0
                                                  ? const Color(0xffE5E5E5)
                                                  :  const Color(
                                                      0xffE5E5E5)),
                                          color: car0
                                              ? Colors.white
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Center(
                                        child: Text(
                                          'A-11',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: car0
                                                  ? Colors.black
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Image(
                                    image:
                                        AssetImage('assets/whitecar.png'),
                                    height: 55.42,
                                    width: 29.43,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const DottedLine(
                              direction: Axis.vertical,
                              lineLength: 138,
                              lineThickness: 1.0,
                              dashColor: Color(0xffACAEBE),
                              dashGapLength: 4.0),
                          InkWell(
                            onTap: () {
                              setState(() {
                                car0 = false;
                                car1 = true;
                                car2 = false;
                                car3 = false;
                                image= false;
                              });
                            },
                            child: SizedBox(
                              height: 150,
                              width: 90,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      height: 23,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: car1
                                                  ? const Color(0xffE5E5E5)
                                                  : const Color(
                                                      0xffE5E5E5)),
                                          color: car1
                                              ? Colors.white
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Center(
                                        child: Text(
                                          'A-12',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: car1
                                                  ? Colors.black
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Image(
                                    image:
                                        AssetImage('assets/whitecar.png'),
                                    height: 55.42,
                                    width: 29.43,
                                  )
                                ],
                              ),
                            ),
                          ),
                          /// sport 13 full///
                          Stack(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: DottedLine(
                                    direction: Axis.vertical,
                                    lineLength: 136,
                                    lineThickness: 1.0,
                                    dashColor: Color(0xffACAEBE),
                                    dashGapLength: 4.0),
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    car0 = false;
                                    car1 = false;
                                    car2 = true;
                                    car3 = false;
                                    image= false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    car2 ? const Image(
                                      image: AssetImage('assets/bluepic.png'),
                                      width: 90,
                                      height: 150,
                                    ):const SizedBox(),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    car0 = false;
                                    car1 = false;
                                    car2 = true;
                                    car3 = false;
                                    image= false;
                                  });
                                },
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      width: 90,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical:25 ),
                                            child: Container(
                                              height: 23,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: car2
                                                          ? Colors.black
                                                          : const Color(
                                                              0xff2378EF)),
                                                  color: car2
                                                      ? Colors.black
                                                      : Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: Center(
                                                child: Text(
                                                  'A-13',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: car2
                                                          ? Colors.white
                                                          : Colors.black,),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Get.height*0.02,
                                          ),
                                          car2? Text(
                                            'Selected',
                                            style: TextStyle(
                                                fontSize: 10.09,
                                                fontWeight: FontWeight.w700,
                                                color:notifire.getwhiteblackcolor),
                                          )
                                              : Text(
                                            'Available',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color:notifire.getwhiteblackcolor),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const DottedLine(
                              direction: Axis.vertical,
                              lineLength: 138,
                              lineThickness: 1.0,
                              dashColor: Color(0xffACAEBE),
                              dashGapLength: 4.0),
                          InkWell(
                            onTap: () {
                              setState(() {});
                              car0 = false;
                              car1 = false;
                              car2 = false;
                              car3 = true;
                            },
                            child: SizedBox(
                              height: 150,
                              width: 89,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      height: 23,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: car3
                                                  ? const Color(0xffE5E5E5)
                                                  : const Color(
                                                      0xffE5E5E5)),
                                          color: car3
                                              ? Colors.white
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Center(
                                        child: Text(
                                          'A-14',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: car3
                                                  ? Colors.black
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Image(
                                    image:
                                        AssetImage('assets/whitecar.png'),
                                    height: 55.42,
                                    width: 29.43,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children:  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                      child: Text('ENTRANCE',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color:notifire.getwhiteblackcolor)),
                    ),
                    const Image(
                      image: AssetImage('assets/framy.png'),
                      width: 39,
                      height: 13,
                    )
                  ],
                ),
                SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Row(
                    children: [
                      InkWell(
                        // onTap: () {
                        //   setState(() {
                        //     carb0 = true;
                        //     carb1 = false;
                        //     carb2 = false;
                        //     carb3 = false;
                        //   });
                        // },
                        child: SizedBox(
                          height: 135,
                          width: 88,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Get.height*0.03,
                              ),
                              const Image(
                                image:
                                AssetImage('assets/carb.png'),
                                height: 55.42,
                                width: 29.43,
                              ),
                              SizedBox(
                                height: Get.height*0.03,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    ),
                                child: Container(
                                  height: 23,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: carb0
                                              ? Colors.black
                                              : const Color(
                                              0xffE5E5E5)),
                                      color: carb0
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(100)),
                                  child: Center(
                                    child: Text(
                                      'B-11',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: carb0
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 13),
                        child: DottedLine(
                            direction: Axis.vertical,
                            lineLength: 136,
                            lineThickness: 1.0,
                            dashColor: Color(0xffACAEBE),
                            dashGapLength: 4.0),
                      ),
                      InkWell(
                        // onTap: () {
                        //   setState(() {
                        //     carb0 = false;
                        //     carb1 = true;
                        //     carb2 = false;
                        //     carb3 = false;
                        //   });
                        // },
                        child: SizedBox(
                          height: 135,
                          width: 89,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Get.height*0.03,
                              ),
                              const Image(
                                image:
                                AssetImage('assets/carb.png'),
                                height: 55.42,
                                width: 29.43,
                              ),
                              SizedBox(
                                height: Get.height*0.03,
                              ),
                              Container(
                                height: 23,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: carb1
                                            ? Colors.black
                                            : const Color(
                                            0xffE5E5E5)),
                                    color: carb1
                                        ? Colors.black
                                        : Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(100)),
                                child: Center(
                                  child: Text(
                                    'B-12',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: carb1
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 13),
                        child: DottedLine(
                            direction: Axis.vertical,
                            lineLength: 136,
                            lineThickness: 1.0,
                            dashColor: Color(0xffACAEBE),
                            dashGapLength: 4.0),
                      ),
                      InkWell(
                        // onTap: () {
                        //   setState(() {
                        //     carb0 = false;
                        //     carb1 = false;
                        //     carb2 = true;
                        //     carb3 = false;
                        //   });
                        // },
                        child: SizedBox(
                          height: 135,
                          width: 90,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Get.height*0.03,
                              ),
                              const Image(
                                image:
                                AssetImage('assets/carb.png'),
                                height: 55.42,
                                width: 29.43,
                              ),
                              // Text(
                              //   'Available',
                              //   style: TextStyle(
                              //     color: carc1
                              //         ? Colors.black
                              //         : Colors.black,
                              //     fontFamily: 'Gilroy',
                              //     fontWeight: FontWeight.w700,
                              //     fontSize: 14,
                              //   ),
                              // ),
                              SizedBox(
                                height: Get.height*0.03,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                ),
                                child: Container(
                                  height: 23,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: carb2
                                              ? const Color(0xff2378EF)
                                              : const Color(
                                              0xffE5E5E5)),
                                      color: carb2
                                          ? Colors.white
                                          : Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(100)),
                                  child: Center(
                                    child: Text(
                                      'B-13',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: carb2
                                              ? Colors.black
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 13),
                        child: DottedLine(
                            direction: Axis.vertical,
                            lineLength: 136,
                            lineThickness: 1.0,
                            dashColor: Color(0xffACAEBE),
                            dashGapLength: 4.0),
                      ),
                      InkWell(
                        // onTap: () {
                        //   setState(() {
                        //     carb0 = false;
                        //     carb1 = false;
                        //     carb2 = false;
                        //     carb3 = true;
                        //   });
                        // },
                        child: SizedBox(
                          height: 135,
                          width: 88,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Get.height*0.03,
                              ),
                              const Image(
                                image:
                                AssetImage('assets/carb.png'),
                                height: 55.42,
                                width: 29.43,
                              ),
                              SizedBox(
                                height: Get.height*0.03,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                ),
                                child: Container(
                                  height: 23,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: carb3
                                              ? Colors.black
                                              : const Color(
                                              0xffE5E5E5)),
                                      color: carb3
                                          ? Colors.black
                                          : Colors.white,
                                      borderRadius:
                                      BorderRadius.circular(100)),
                                  child: Center(
                                    child: Text(
                                      'B-14',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: carb3
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 170,
                  width: double.infinity,
                  child: Column(
                    children: [
                      const DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashColor: Color(0xffACAEBE),
                          dashGapLength: 4.0),
                      Row(
                        children: [
                          InkWell(
                            // onTap: () {
                            //   setState(() {
                            //     carc0 = true;
                            //     carc1 = false;
                            //     carc2 = false;
                            //     carc3 = false;
                            //   });
                            // },
                            child: SizedBox(
                              height: 140,
                              width: 88,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      height: 23,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: carc0
                                                  ? Colors.black
                                                  : const Color(
                                                  0xffE5E5E5)),
                                          color: carc0
                                              ? Colors.black
                                              : Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(100)),
                                      child: Center(
                                        child: Text(
                                          'C-11',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: carc0
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height*0.01,
                                  ),
                                  const Image(
                                    image:
                                    AssetImage('assets/whitecar.png'),
                                    height: 55.42,
                                    width: 29.43,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const DottedLine(
                              direction: Axis.vertical,
                              lineLength: 140,
                              lineThickness: 1.0,
                              dashColor: Color(0xffACAEBE),
                              dashGapLength: 4.0),
                          InkWell(
                            // onTap: () {
                            //   setState(() {
                            //     carc0 = false;
                            //     carc1 = true;
                            //     carc2 = false;
                            //     carc3 = false;
                            //   }
                            //   );
                            // },
                            child: SizedBox(
                              height: 140,
                              width: 90,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      height: 23,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: carc1
                                                  ? const Color(0xffE5E5E5)
                                                  : const Color(
                                                  0xffE5E5E5)),
                                          color: carc1
                                              ? Colors.transparent
                                              : Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(
                                              100)),
                                      child: Center(
                                        child: Text(
                                          'C-12',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: carc1
                                                  ? Colors.black
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height*0.01,
                                  ),
                                  const Image(
                                    image:
                                    AssetImage('assets/whitecar.png'),
                                    height: 55.42,
                                    width: 29.43,
                                  )
                                  // Text(
                                  //   'Available',
                                  //   style: TextStyle(
                                  //     color: carc1
                                  //         ? Colors.black
                                  //         : Colors.black,
                                  //     fontFamily: 'Gilroy',
                                  //     fontWeight: FontWeight.w700,
                                  //     fontSize: 14,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                          const DottedLine(
                              direction: Axis.vertical,
                              lineLength: 140,
                              lineThickness: 1.0,
                              dashColor: Color(0xffACAEBE),
                              dashGapLength: 4.0),
                          InkWell(
                            // onTap: () {
                            //   setState(() {
                            //     carc0 = false;
                            //     carc1 = false;
                            //     carc2 = true;
                            //     carc3 = false;
                            //   });
                            // },
                            child: SizedBox(
                              height: 140,
                              width: 90,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      height: 23,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: carc2
                                                  ? Colors.black
                                                  : const Color(
                                                  0xffE5E5E5)),
                                          color: carc2
                                              ? Colors.black
                                              : Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(100)),
                                      child: Center(
                                        child: Text(
                                          'C-13',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: carc2
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height*0.01,
                                  ),
                                  const Image(
                                    image:
                                    AssetImage('assets/whitecar.png'),
                                    height: 55.42,
                                    width: 29.43,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const DottedLine(
                              direction: Axis.vertical,
                              lineLength: 140,
                              lineThickness: 1.0,
                              dashColor: Color(0xffACAEBE),
                              dashGapLength: 4.0),
                          InkWell(
                            // onTap: () {
                            //   setState(() {});
                            //   carc0 = false;
                            //   carc1 = false;
                            //   carc2 = false;
                            //   carc3 = true;
                            // },
                            child: SizedBox(
                              height: 140,
                              width: 89,
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    child: Container(
                                      height: 23,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xffE5E5E5)),
                                          color: Colors.white,
                                          // border: Border.all(
                                          //     color: carc3
                                          //         ? Color(0xffE5E5E5)
                                          //         : Colors.black) ,
                                          // color: carc3
                                          //     ? Colors.white
                                          //     : Colors.black,
                                          borderRadius:
                                          BorderRadius.circular(100)),
                                      child: const Center(
                                        child: Text(
                                          'C-14',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              // color: carc3
                                              //     ? Colors.black
                                                 // : Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height*0.01,
                                  ),
                                   const Image(
                                    image:
                                    AssetImage('assets/whitecar.png'),
                                    height: 55.42,
                                    width: 29.43,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    const Image(
                      image: AssetImage('assets/fram.png'),
                      width: 39,
                      height: 13,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      child: Text('EXIT',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color:notifire.getwhiteblackcolor)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Get.height*0.03
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 52,
                width: 340,
                child: RoundeButtonblue(
                  btnName: 'Pick Parking Spot',
                  textStyle:
                      const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  callBack: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Bookingpage();
                      },
                    ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

