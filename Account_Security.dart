// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';

class Accountsecurity extends StatefulWidget {
  const Accountsecurity({Key? key}) : super(key: key);

  @override
  State<Accountsecurity> createState() => _AccountsecurityState();
}

class _AccountsecurityState extends State<Accountsecurity> {

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
        backgroundColor:notifire.getbgcolor,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Account Security',
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
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '1. Terms',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color:notifire.getwhiteblackcolor)
                  ),
                  SizedBox(
                    height: Get.height*0.02,
                  ),
                  const Text(
                      'This is Macquarie car park\n',
                          
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color:Colors.grey)
                  ),
                  SizedBox(
                    height: Get.height*0.02,
                  ),
                  const Text(
                      'This is Macquarie car park\n',
                
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color:Colors.grey)
                  ),
                  SizedBox(
                    height: Get.height*0.02,
                  ),
                  Text(
                      '2. Changes to the Service and/or Terms:',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color:notifire.getwhiteblackcolor)
                  ),
                  SizedBox(
                    height: Get.height*0.02,
                  ),
                  const Text(
                      'This is a Macquarie Car park\n',
                          
                       
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color:Colors.grey)
                  ),
                  SizedBox(
                    height: Get.height*0.02,
                  ),
                  const Text(
                      'This is MAcquarie Car park\n' ,
                          
                  
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color:Colors.grey)
                  ),
                  SizedBox(
                    height: Get.height*0.02,
                  ),
                  Text(
                      '3. Create an Acknowledgment Statement',
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: notifire.getwhiteblackcolor)
                  ),
                  SizedBox(
                    height: Get.height*0.02,
                  ),
                  const Text(
                      'This is MAcquarie Car park\n',
                          
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color:Colors.grey)
                  ),
                  SizedBox(
                    height: Get.height*0.02,
                  ),
                  const Text(
                      'This is MAcquarie Car park\n',
                          
                      style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color:Colors.grey)
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
