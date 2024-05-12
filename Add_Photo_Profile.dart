// ignore_for_file: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Account&Setting/Add_Vehicle.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';

class Addphoto extends StatefulWidget {
  const Addphoto({Key? key}) : super(key: key);

  @override
  State<Addphoto> createState() => _AddphotoState();
}

class _AddphotoState extends State<Addphoto> {
  File? pickedImage;

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
              height: Get.height*0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pick Profile Picture',
                    style: TextStyle(
                        fontSize: 18,
                        color:notifire.getwhiteblackcolor,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Addvehical();
                        },
                      ));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(fontSize: 12, color:notifire.getwhiteblackcolor),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 24, right: 15),
              child: const Text(
                "Have a favorite selfie? Upload it now and let everyone see your amazing face.",
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff75788d),
                    fontWeight: FontWeight.w400),
              ),
            ),
            // imageprofile(),
             SizedBox(
               height: Get.height*0.06,
            ),
            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: ClipOval(
                      child: pickedImage != null
                          ? Image.file(
                              pickedImage!,
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/avtar.png',
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: notifire.getdarkmodecolor,
                                  insetPadding: EdgeInsets.zero,
                                  contentPadding: EdgeInsets.zero,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  title: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Pick Profile Picture',
                                        style: TextStyle(
                                            color:notifire.getwhiteblackcolor,
                                            fontSize: 18),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.close),color: notifire.getwhiteblackcolor)
                                    ],
                                  )),
                                  actions: [
                                    Column(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal:25),
                                          child: GestureDetector(
                                        onTap: () {
                                          pickImage(ImageSource.camera);
                                        },
                                        child: Text(
                                          'Take photo',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:notifire.getwhiteblackcolor),
                                        ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Divider(
                                          color: Color(0xffE5E5E5),
                                          indent: 20,
                                          endIndent: 20,
                                          thickness: 2,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.symmetric(horizontal: 20),
                                          child: GestureDetector(
                                        onTap: () {
                                          pickImage(ImageSource.gallery);
                                        },
                                        child: Text(
                                          'Choose exisiting photo',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:notifire.getwhiteblackcolor),
                                        ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 26,
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          },
                          child:
                              const Image(image: AssetImage('assets/EditButton.png'))))
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.4),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(327, 52),
                    backgroundColor: notifire.getprofile,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const Addvehical();
                    },
                  ));
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                      color:notifire.getprofiletext,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                )),


            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
