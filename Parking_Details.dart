// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widget/Elevetedblue.dart';
import '../theme/theme_manager.dart';
import 'Pick_Parking_Spot.dart';

class Parkingdetails extends StatefulWidget {
  const Parkingdetails({Key? key}) : super(key: key);

  @override
  State<Parkingdetails> createState() => _ParkingdetailsState();
}

class _ParkingdetailsState extends State<Parkingdetails> {
  String? valuechoose;
 
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 240.0,
              floating: false,
              pinned: true,
              backgroundColor: notifire.getbgcolor,
              leading: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                    child: const Icon(Icons.arrow_back,color: Colors.grey,)),
              actions: const [
            
              ],
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset('assets/Rectangle 64.png',
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },

        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: SizedBox(
                  height: 415,
                  width: 320,
                   //color:notifire.getdarkmodecolor,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: SizedBox(
                              height: 20,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                ),
                                child: Text(
                                  "Macquarie car parking Space",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 14,
                                      color: notifire.getwhiteblackcolor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2, left: 70),
                                child: Container(
                                  height: 45,
                                  width: 45,

                                  decoration: const BoxDecoration(
                                     // color: Colors.cyan,
                                      image: DecorationImage(
                                        image: AssetImage('assets/Call.png'),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2, left: 10),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  // color: Colors.cyan,
                                  decoration: const BoxDecoration(
                                    // color: Colors.cyan,
                                      image: DecorationImage(
                                        image: AssetImage('assets/Direction.png'),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: SizedBox(
                          height: 40,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              "This is the address of the parking space",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 10,
                                  color: Color(0xff75788D),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 55),
                            child: Image(
                              image: AssetImage(
                                'assets/routing-2.png',
                              ),
                              height: 16,
                              width: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 56, left: 6),
                            child: Text(
                              "500m",
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 12,
                                  color: notifire.getwhiteblackcolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 55, left: 19),
                            child: Image(
                              image: AssetImage(
                                'assets/autobrightne.png',
                              ),
                              height: 16,
                              width: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 56, left: 6),
                            child: Text(
                              "15 spots available",
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 12,
                                  color: notifire.getwhiteblackcolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 55, left: 25),
                            child: Image(
                              image: const AssetImage(
                                'assets/timer.png',
                              ),
                              color:  notifire.getwhiteblackcolor,
                              height: 16,
                              width: 16,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 58, left: 6),
                            child: Text(
                              "08.00 - 22.00",
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 12,
                                  color: notifire.getwhiteblackcolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 85),
                            child: SizedBox(
                                width: 327,
                                child: Divider(
                                  thickness: 1,
                                  color: Color(0xffE5E5E5),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 0,
                            ),
                            child: Text(
                              "Info",
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 14,
                                  color: notifire.getwhiteblackcolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 5),
                            child: const ReadMoreText(
                              'This is Macquarie car park ',
                                  
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  color: Color(0xff75788D),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12),
                              trimLines: 4,
                              colorClickableText: Color(0xff75788D),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Read  More',
                              trimExpandedText: 'Read less',
                              lessStyle: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff2378EF),
                                  fontWeight: FontWeight.bold),
                              moreStyle: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xff2378EF),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.only(right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 25,
                                  padding: const EdgeInsets.only(top: 10, right: 41),
                                  child: Center(
                                    child: Text(
                                      'Popular Times',
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          color: notifire.getwhiteblackcolor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 118,
                            width: 325,
                            child: Image(
                              image: AssetImage('assets/chart.png'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 52,
                width: 327,
                child: RoundeButtonblue(
                  btnName: 'Pick Parking Spot',
                  textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  callBack: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Pickparking();
                      },
                    ));
                  },
                ),
              ),
              // SizedBox(
              //   height:Get.height*0.02,
              // )
            ],
          ),
        )
      ),
      // backgroundColor: Color(0xffF9FBFC),
      // appBar: AppBar(
      //   toolbarHeight: 230,
      //   // title:Image.asset('assets/Rectangle 64.png',),
      //   title: Container(
      //     height: 230,
      //
      //     decoration: BoxDecoration(
      //         // color: Colors.cyan,
      //       image: DecorationImage(image: AssetImage('assets/Rectangle 64.png'),fit:BoxFit.cover)
      //     ),
      //    ),
      //   actions: [
      //
      //   ],
      // ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       // CustomScrollView(
      //       //   slivers: [
      //       //     SliverAppBar(
      //       //       expandedHeight: 240.0,
      //       //       floating: true,
      //       //       pinned: true,
      //       //       flexibleSpace: FlexibleSpaceBar(
      //       //           centerTitle: true,
      //       //           title: Text("hello",
      //       //               style: TextStyle(
      //       //                 color: Colors.white,
      //       //                 fontSize: 16.0,
      //       //               )),
      //       //           background: Image.asset('assets/Rectangle 64.png',
      //       //             fit: BoxFit.cover,
      //       //           )),
      //       //     ),
      //       //   ],
      //       // ),
      //        Container(
      //           height: 270,
      //           width: double.infinity,
      //           decoration: BoxDecoration(
      //               image: DecorationImage(
      //                   image: AssetImage('assets/Rectangle 64.png'))),
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      //             child: Column(
      //               children: [
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     InkWell(
      //                         onTap: () {
      //                           Navigator.pop(context);
      //                         },
      //                         child: Icon(
      //                           Icons.arrow_back,
      //                           color: Colors.white,
      //                         )),
      //                     Image(
      //                       image: AssetImage('assets/hart.png'),
      //                       height: 17.8,
      //                       width: 20,
      //                     )
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 20),
      //         child: Container(
      //           height: 420,
      //           width: 320,
      //           // color: Colors.cyan,
      //           child: Stack(
      //             children: [
      //               Row(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Padding(
      //                     padding: EdgeInsets.only(top: 0),
      //                     child: Container(
      //                       height: 20,
      //                       child: Padding(
      //                         padding: EdgeInsets.only(
      //                           top: 4,
      //                         ),
      //                         child: Text(
      //                           "Jainam District Space",
      //                           textAlign: TextAlign.start,
      //                           style: TextStyle(
      //                               fontFamily: 'Gilroy',
      //                               fontSize: 14,
      //                               color: Color(0xff222741),
      //                               fontWeight: FontWeight.w700),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   Column(
      //                     children: [
      //                       Padding(
      //                         padding: EdgeInsets.only(top: 2, left: 70),
      //                         child: Container(
      //                           height: 45,
      //                           width: 45,
      //                           // color: Colors.cyan,
      //                           decoration: BoxDecoration(
      //                               // color: Colors.cyan,
      //                               image: DecorationImage(
      //                             image: AssetImage('assets/Call.png'),
      //                             fit: BoxFit.cover,
      //                           )),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Column(
      //                     children: [
      //                       Padding(
      //                         padding: EdgeInsets.only(top: 2, left: 10),
      //                         child: Container(
      //                           height: 45,
      //                           width: 45,
      //                           // color: Colors.cyan,
      //                           decoration: BoxDecoration(
      //                               // color: Colors.cyan,
      //                               image: DecorationImage(
      //                             image: AssetImage('assets/Direction.png'),
      //                             fit: BoxFit.cover,
      //                           )),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //               Padding(
      //                 padding: EdgeInsets.only(top: 5),
      //                 child: Container(
      //                   height: 40,
      //                   child: Padding(
      //                     padding: EdgeInsets.only(
      //                       top: 20,
      //                     ),
      //                     child: Text(
      //                       "This is the address of the parking space",
      //                       textAlign: TextAlign.start,
      //                       style: TextStyle(
      //                           fontFamily: 'Gilroy',
      //                           fontSize: 10,
      //                           color: Color(0xff75788D),
      //                           fontWeight: FontWeight.w400),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Container(
      //                     child: Padding(
      //                       padding: EdgeInsets.only(top: 55),
      //                       child: Image(
      //                         image: AssetImage(
      //                           'assets/routing-2.png',
      //                         ),
      //                         height: 16,
      //                         width: 16,
      //                       ),
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.only(top: 56, left: 6),
      //                     child: Text(
      //                       "500m",
      //                       style: TextStyle(
      //                           fontFamily: 'Gilroy',
      //                           fontSize: 12,
      //                           color: Color(0xff222741),
      //                           fontWeight: FontWeight.w700),
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.only(top: 55, left: 19),
      //                     child: Image(
      //                       image: AssetImage(
      //                         'assets/autobrightness.png',
      //                       ),
      //                       height: 16,
      //                       width: 16,
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.only(top: 56, left: 6),
      //                     child: Text(
      //                       "15 spots available",
      //                       style: TextStyle(
      //                           fontFamily: 'Gilroy',
      //                           fontSize: 12,
      //                           color: Color(0xff222741),
      //                           fontWeight: FontWeight.w700),
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.only(top: 55, left: 25),
      //                     child: Image(
      //                       image: AssetImage(
      //                         'assets/timer.png',
      //                       ),
      //                       height: 16,
      //                       width: 16,
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.only(top: 56, left: 6),
      //                     child: Text(
      //                       "08.00 - 22.00",
      //                       style: TextStyle(
      //                           fontFamily: 'Gilroy',
      //                           fontSize: 12,
      //                           color: Color(0xff222741),
      //                           fontWeight: FontWeight.w700),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Padding(
      //                     padding: EdgeInsets.only(top: 85),
      //                     child: Container(
      //                         width: 327,
      //                         child: Divider(
      //                           thickness: 1,
      //                           color: Color(0xffE5E5E5),
      //                         )),
      //                   ),
      //                   SizedBox(
      //                     height: 20,
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.only(
      //                       top: 0,
      //                     ),
      //                     child: Text(
      //                       "Info",
      //                       style: TextStyle(
      //                           fontFamily: 'Gilroy',
      //                           fontSize: 14,
      //                           color: Color(0xff222741),
      //                           fontWeight: FontWeight.w700),
      //                     ),
      //                   ),
      //                   Container(
      //                     padding: EdgeInsets.only(top: 5),
      //                     child: ReadMoreText(
      //                       'Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor '
      //                       'incididunt ut labore et dolore\nmagna aliqua. Ut enim ad minim veniam, quis '
      //                       'nostrud \nexercitation ullamco laboris nisi ut aliquip ex... \nLorem ipsum dolor sit amet, consectetur adipiscing elit ',
      //                       style: TextStyle(
      //                           fontFamily: 'Gilroy',
      //                           color: Color(0xff75788D),
      //                           fontWeight: FontWeight.w700,
      //                           fontSize: 12),
      //                       trimLines: 4,
      //                       colorClickableText: Color(0xff75788D),
      //                       trimMode: TrimMode.Line,
      //                       trimCollapsedText: 'Read  More',
      //                       trimExpandedText: 'Read less',
      //                       lessStyle: TextStyle(
      //                           fontSize: 12,
      //                           color: Color(0xff2378EF),
      //                           fontWeight: FontWeight.bold),
      //                       moreStyle: TextStyle(
      //                           fontSize: 12,
      //                           color: Color(0xff2378EF),
      //                           fontWeight: FontWeight.bold),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 15,
      //                   ),
      //                   Container(
      //                     padding: EdgeInsets.only(right: 20),
      //                     child: Row(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Container(
      //                           height: 25,
      //                           padding: EdgeInsets.only(top: 10, right: 41),
      //                           child: Center(
      //                             child: Text(
      //                               'Popular Times',
      //                               style: TextStyle(
      //                                   fontFamily: 'Gilroy',
      //                                   color: Color(0xff222741),
      //                                   fontWeight: FontWeight.w700,
      //                                   fontSize: 14),
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: EdgeInsets.only(left: 44),
      //                           child: Container(
      //                             height: 45,
      //                             width: 125,
      //                             decoration: BoxDecoration(
      //                                 // color: Colors.cyan,
      //                                 color: Color(0xffF8F8F8),
      //                                 borderRadius: BorderRadius.circular(100)),
      //                             child: Padding(
      //                               padding: EdgeInsets.only(left: 10),
      //                               child: Container(
      //                                 child: DropdownButton(
      //                                   borderRadius: BorderRadius.circular(10),
      //                                   icon: Icon(
      //                                       Icons.keyboard_arrow_down_outlined),
      //                                   iconSize: 30,
      //                                   // isExpanded: true,
      //                                   underline: SizedBox(),
      //                                   value: dates,
      //                                   onChanged: (newvalue) {
      //                                     setState(() {
      //                                       dates = newvalue as String?;
      //                                     });
      //                                   },
      //                                   items: listitem.map((valueItem) {
      //                                     return DropdownMenuItem(
      //                                       value: valueItem,
      //                                       child: Text(valueItem),
      //                                     );
      //                                   }).toList(),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 10,
      //                   ),
      //                   Container(
      //                     height: 118,
      //                     width: 325,
      //                     child: Image(
      //                       image: AssetImage('assets/chart.png'),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //
      //       Container(
      //         height: 52,
      //         width: 327,
      //         child: RoundeButtonblue(
      //           btnName: 'Pick Parking Spot',
      //           textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
      //           callBack: () {
      //             Navigator.push(context, MaterialPageRoute(
      //               builder: (context) {
      //                 return pickparking();
      //               },
      //             ));
      //           },
      //         ),
      //       ),
      //       SizedBox(
      //         height:Get.height*0.03,
      //        )
      //     ],
      //   ),
      // ),
    );
  }
}
