import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Account&Setting/Account.dart';
import '../MAIN_PAGE/Home.dart';

import '../theme/theme_manager.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    getdarkmodepreviousstate();
  }

  List<Widget> myChilders = const [
    Home(),
    
   
    Account(),
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
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return WillPopScope(
      onWillPop: ()async {
        return false;
      },
      child: Scaffold(
        
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: myChilders),
        bottomNavigationBar: BottomAppBar(
          color:notifire.getdarkmodecolor,
          child: TabBar(
            onTap: (index) {
              setState(
                () {
                  selectedIndex = index;
                },
              );
            },
            indicator: const UnderlineTabIndicator(
               borderSide: BorderSide(color: Colors.transparent,),
            ),
            //isScrollable: true,

            indicatorSize: TabBarIndicatorSize.label,

            controller: tabController,
            tabs: [
              Tab(
                  iconMargin:  const EdgeInsets.only(bottom: 3, top: 5),
                  icon: //Icon(Icons.home_filled),
                      selectedIndex == 0
                          ? Image.asset("assets/homeb.png",
                              height: 20, width: 20, color: const Color(0xff2378EF))
                          : Image.asset("assets/homes.png",
                              height: 20, width: 20, color: const Color(0xffACAEBE)),
                  child: selectedIndex == 0
                      ? const Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff2378EF)),
                        )
                      : const Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffACAEBE)),
                        )),
              
             
              Tab(
                iconMargin: const EdgeInsets.only(bottom: 3, top: 5),
                icon: //Icon(Icons.shopping_bag_outlined),
                    selectedIndex == 3
                        ? Image.asset("assets/userb.png",
                            height: 20, width: 20, color: const Color(0xff2378EF))
                        : Image.asset("assets/users.png",
                            height: 20, width: 201, color: const Color(0xffACAEBE)),
                child:  selectedIndex == 3
                    ? const Text(
                  'Account',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff2378EF)),
                )
                    : const Text(
                  'Account',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffACAEBE)),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}