// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';

class Vehicaledit extends StatefulWidget {
  const Vehicaledit({Key? key}) : super(key: key);

  @override
  State<Vehicaledit> createState() => _VehicaleditState();
}

class _VehicaleditState extends State<Vehicaledit> {

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
        backgroundColor:notifire.getbgcolor,
        leading: BackButton(
          color: notifire.getwhiteblackcolor,
        ),
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'Edit Vehicle',
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
      body: const SingleChildScrollView(

      ),
    );
  }
}
