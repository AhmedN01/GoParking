// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';
import 'Parking_Details.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool selectedcar = true;
  bool selectedmotorcycle = false;
  bool selectedtruck = false;
  List<Items> item = [
    Items(
      id: 1,
      title: "Macquarie car parking Space",
      image: "assets/Rectangle58.png",
      text1: "500m",
      text2: "15 spots available",
    ),
    Items(
      id: 2,
      title: "West 2 car parking Space",
      image: "assets/Rectangle59.png",
      text1: "900m",
      text2: "20 spots available",
    ),
    Items(
      id: 3,
      title: "West 3 car parking Space",
      image: "assets/Rectangle58.png",
      text1: "1.2km",
      text2: "10 spots available",
    ),
    Items(
      id: 4,
      title: "West 4 car parking Space",
      image: "assets/Rectangle59.png",
      text1: "100m",
      text2: "02 spots available",
    ),
    Items(
      id: 5,
      title: "West 5 car parking Space",
      image: "assets/Rectangle58.png",
      text1: "700m",
      text2: "08 spots available",
    ),
    Items(
      id: 6,
      title: "West 6 car parking Space",
      image: "assets/Rectangle59.png",
      text1: "2km",
      text2: "20 spots available",
    ),
  ];

  // DateTime dateTime = DateTime(2022);

  late ColorNotifire notifire;

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  String? valuechoose;
  List listitem = [
    'Today | 9.30',
    'Tomorrow | 9.30',
    'yesterday | 9.30',
  ];

  String? exitbefore;
  List listitems = [
    'Today | 8.00',
    'Tomorrow | 9.30',
    'yesterday | 10.30',
  ];
  String? selectarrive = 'Today | 9.30';
  String? selectaexit = 'Today | 8.00';

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65.0),
        child: Padding(
          padding: const EdgeInsets.only(),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 330,
            flexibleSpace: const Image(
              image: AssetImage('assets/Background.png'),
              fit: BoxFit.cover,
            ),
            leading: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Text(
                          'EZy Park',
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              color: notifire.getdarkwhitecolor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Mark and choose your parking favorite spot!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: notifire.getdarkwhitecolor,
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
               
              ],
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor:notifire.getbgcolor,
      body: Stack(
        children: [
        
        
          Positioned(
            child: SizedBox(
              //color: Colors.grey,
              width: MediaQuery.of(context).size.width,
              height: Get.height * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.14,
                    ),
                   
                    SizedBox(
                      height: Get.height * 0.02,
                    ),

                  
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20,
                            padding: const EdgeInsets.only(),
                            child: Text(
                              'Nearby Space',
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 14,
                                  color:notifire.getwhiteblackcolor,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                       
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(top: 1),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const Parkingdetails();
                                },
                              ));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Card(
                                    color:notifire.getdarkmodecolor,
                                    elevation: 0.2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          right: 10,
                                          left: 10,
                                          bottom: 10,
                                          top: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 78,
                                            height: 78,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "${item[index].image}"),
                                                  scale: 1,
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          const SizedBox(width: 15),
                                          Padding(
                                            padding: const EdgeInsets.only(),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    SizedBox(
                                                      height: 16,
                                                      width: Get.width * 0.4,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                top: 0,
                                                                bottom: 0),
                                                        child: Text(
                                                          "${item[index].title}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Gilroy',
                                                              fontSize: 14,
                                                              color:notifire.getwhiteblackcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                        // color: Colors.cyan,
                                                        margin:
                                                            const EdgeInsets.only(
                                                                left: 30),
                                                        height: 15,
                                                        width: 13,
                                                        child: GestureDetector(
                                                            onTap: () {},
                                                            child: const Image(
                                                                image: AssetImage(
                                                                    'assets/heart.png'),color: Colors.grey,))),
                                                  ],
                                                ),
                                                const SizedBox(height: 4),
                                                const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 4),
                                                  child: Text(
                                                    'This is the address of the parking space',
                                                    style: TextStyle(
                                                        fontFamily: 'Gilroy',
                                                        fontSize: 10,
                                                        color:
                                                            Color(0xff75788D),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                                                  children: [
                                                    const Image(
                                                      image: AssetImage(
                                                        'assets/routing-2.png',
                                                      ),
                                                      height: 16,
                                                      width: 16,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(
                                                        "${item[index].text1}",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Gilroy',
                                                            fontSize: 12,
                                                            color:notifire.getwhiteblackcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.only(
                                                              left: 15),
                                                      child: Image(
                                                        image: AssetImage(
                                                          'assets/autobrightne.png',
                                                        ),
                                                        height: 16,
                                                        width: 16,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: Text(
                                                        "${item[index].text2}",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Gilroy',
                                                            fontSize: 12,
                                                            color: notifire.getwhiteblackcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                  ],
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
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class Items {
  int? id;
  String? title;
  String? text1;
  String? text2;
  String? subtitle;
  String? image;

  Items({
    this.id,
    this.text1,
    this.text2,
    this.title,
    this.subtitle,
    this.image,
  });
}