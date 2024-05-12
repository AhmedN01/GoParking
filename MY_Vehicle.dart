// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme_manager.dart';
import 'Add_Vehicle.dart';
import 'My_Vehical_Edit.dart';

class Myvehicle extends StatefulWidget {
  const Myvehicle({Key? key}) : super(key: key);

  @override
  State<Myvehicle> createState() => _MyvehicleState();
}

class _MyvehicleState extends State<Myvehicle> {

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
          color:notifire.getwhiteblackcolor,
        ),
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'My Vehicle',
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                tileColor: notifire.getdarkmodecolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                leading: const Image(
                  image: AssetImage("assets/carblue.png"),
                  height: 44,
                  width: 44,
                ),
                title: Text(
                  "Toyota Camry",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color:notifire.getwhiteblackcolor,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: const Text(
                  "DB 34FS",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 10,
                      color: Color(0xff75788D),
                      fontWeight: FontWeight.w400),
                ),
                trailing: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Vehicaledit();
                        },
                      ));
                    },
                    child: const Image(
                        image: AssetImage('assets/edit.png'),
                        width: 24,
                        height: 24)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                tileColor:notifire.getdarkmodecolor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                leading: const Image(
                  image: AssetImage("assets/scooterb.png"),
                  height: 44,
                  width: 44,
                ),
                title: Text(
                  "Yamha R1",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      color:notifire.getwhiteblackcolor,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: const Text(
                  "CP 321",
                  style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 10,
                      color: Color(0xff75788D),
                      fontWeight: FontWeight.w400),
                ),
                trailing: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const Vehicaledit();
                        },
                      ));
                    },
                    child: const Image(
                        image: AssetImage('assets/edit.png'),
                        width: 24,
                        height: 24)),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Addvehical();
                      },
                    ));
                  },
                  child: const Text(
                    'Add Vehicle',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      color: Color(0xff2378EF),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 9,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const Addvehical();
                      },
                    ));
                  },
                  child: const Image(
                    image: AssetImage('assets/plus.png'),
                    height: 18,
                    width: 18,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// list view nu list
// List<Items> Item = [
//   Items(
//     id: 0,
//     title: "BMW 320i Sport",
//     subtitle:'B 3647 KA',
//     image: "assets/carblue.png",
//   ),
//   Items(
//     id: 1,
//     title: " Vespa Primavera",
//     subtitle:'B 0993 CGK',
//     image: "assets/scooterb.png",
//   ),
// ];
///
///listview builder
// ListView.builder(
// itemCount: 2,
// shrinkWrap: true,
// itemBuilder: (context, index) {
// return Padding(
// padding: EdgeInsets.symmetric(horizontal: 24, vertical:10),
// child: ListTile(
// contentPadding:
// EdgeInsets.symmetric(horizontal: 15, vertical: 5),
// tileColor: Colors.white,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10)),
// leading: Image(
// image: AssetImage("${Item[index].image}"),
// height: 44,
// width: 44,
// ),
// title: Text(
// "${Item[index].title}",
// style: TextStyle(
// fontFamily: 'Gilroy',
// fontSize: 14,
// color: Color(0xff222741),
// fontWeight: FontWeight.w700),
// ),
// subtitle: Text(
// "${Item[index].subtitle}",
// style: TextStyle(
// fontFamily: 'Gilroy',
// fontSize: 10,
// color: Color(0xff75788D),
// fontWeight: FontWeight.w400),
// ),
// trailing: InkWell(
// onTap: () {},
// child: Image(
// image: AssetImage('assets/edit.png'),
// width: 16,
// height: 17)),
// ),
// );
// },
// ),
///

/// listview class
// class Items {
//   int? id;
//   String? title;
//   String? subtitle;
//   String? image;
//
//   Items({
//     this.id,
//     this.title,
//     this.subtitle,
//     this.image,
//   });
// }

///
