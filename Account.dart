
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Widget/Elevetedblue.dart';
import '../Widget/custom_widget.dart';
import '../signin-up/sign_in.dart';
import '../theme/theme_manager.dart';


import 'My_Vehicle.dart';


class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  
  static  String kEYPASSWORD = "Password";
  var mobilevalue = "Ahmed Naseem";
  var pASSWORD = "ahmed.naseem@students.mq.edu.au";

  bool status = true;

  
  late ColorNotifire notifire;
  late SharedPreferences pref;

  late SharedPreferences logindata;
  late String username;


  @override
  void initState() {

    super.initState();
    getdarkmodepreviousstate();
    initial();
    getvalue();
  }


  

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'My Account',
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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
            child: SizedBox(
              height: 68,
              width: 327,
              // color: Colors.grey,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          decoration: const BoxDecoration(
                            // color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/Avatar.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 16,
                                    width: 140,
                                    child: Text(
                                      'Ahmed Naseem',
                                      // mobilevalue,
                                      style: TextStyle(
                                          fontFamily: 'Gilroy',
                                          fontSize: 14,
                                          color: notifire.getwhiteblackcolor,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                 
                                ],
                              ),
                              Text(
                                'ahmed.naseem@students.mq.edu.au',
                                // PASSWORD,
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 10,
                                    color:notifire.getgreywhitecolor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          accountlist(
            image: 'assets/carblue.png',
            text: "My Vehicle",
            color: notifire.getwhiteblackcolor,
            tileColor: notifire.getdarkmodecolor,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const Myvehicle();
                },
              ));
            },
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: GestureDetector(
              onTap: () {},
              child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal:15, vertical: 5),
                  tileColor: notifire.getdarkmodecolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  leading: const Image(
                    image: AssetImage("assets/DARKMODE.png"),
                    height:45,
                    width:45,
                  ),
                  title: Text(
                    "Dark Mode",
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        color: notifire.getwhiteblackcolor,
                        fontWeight: FontWeight.w700),
                  ),
                  trailing:
                  Transform.scale(
                   alignment: Alignment.centerRight,
                    scale: 0.7,
                    child: CupertinoSwitch(
                      value: status,
                      onChanged: (bool value) async {
                        setState(() {
                          status = value;
                        });
                        final prefs = await SharedPreferences.getInstance();
                        setState(
                          () {
                            notifire.setIsDark = value;
                            prefs.setBool("setIsDark", value);
                          },
                        );
                      },
                    ),
                  )
              ),
            ),
          ),
          SizedBox(height: Get.height * 0.02),
          customelevated(
              btnname: const Text(
                'Logout',
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 14,
                    color: Color(0xffE53935),
                    fontWeight: FontWeight.w700),
              ),
              bgcolor:notifire.getdarkmodecolor,
              callBack: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: notifire.getdarkmodecolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: Row(
                        children: [
                          Text(
                            "Do You Want to LogOut?",
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 18,
                                color:notifire.getwhiteblackcolor,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image(
                                  image: const AssetImage('assets/X.png'),
                                  color: notifire.getwhiteblackcolor,
                                  height: 24,
                                  width: 24,
                                )),
                          ),
                        ],
                      ),
                      actions: [
                        customelevated(
                          btnname: const Text(
                            'Yes, I want to logout',
                            style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffE53935)),
                          ),
                          bgcolor:notifire.getblackwhitecolor,
                          callBack: () {
                            logindata.setBool('login', true);
                            setState(() {
                              valueClear();
                             // Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const Signin();
                                },
                              ));

                            });
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        RoundeButtonblue(
                            btnName: 'No, stay logged in',
                            callBack: () {
                              Navigator.pop(context);
                            }),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                );
                return null;
              }),
          SizedBox(height: Get.height * 0.02),
          Text(
            "App Designed & Created By Ahmed",
            style: TextStyle(
                fontFamily: 'Gilroy',
                fontSize: 14,
                color:notifire.getgreywhitecolor,
                fontWeight: FontWeight.w700),
          ),
        ]),
      ),
    );
  }

  Future<void> valueClear() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }


  Future<void> getvalue() async {
    var prefs = await SharedPreferences.getInstance();
    var getMOBILE = prefs.getString(mobilevalue);
    var getPASSWORD = prefs.getString(kEYPASSWORD);

    mobilevalue = getMOBILE ?? "Goku";
    pASSWORD = getPASSWORD ?? "Gokussj3@gmail.com";
    setState(() {});
  }

  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    bool? previusstate = prefs.getBool("setIsDark");
    status = previusstate ?? false;
    if (previusstate == null) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }
}
