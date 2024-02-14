import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappstatussaver/constrains/colors.dart';
import 'package:whatsappstatussaver/provider/bottom_nav_provider.dart';
 
import 'package:whatsappstatussaver/screens/bottomnavpages.dart/image/image.dart';
import 'package:whatsappstatussaver/screens/bottomnavpages.dart/image/video.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  List<Widget> pages = const[ImageHomePage(),VideoHome()];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, nav, child) => Scaffold(
        body: pages[nav.currentIndex],
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: const [Icons.photo_library , Icons.smart_display,],
          iconSize: 40,
          activeIndex: nav.currentIndex, 
          gapLocation: GapLocation.none,  
          onTap: (value) {
            nav.changeIndex(value);
          },
          backgroundColor: Colors.white.withOpacity(0.2),
          activeColor: KGreen,  
          inactiveColor: Kwhitecolor,
          shadow: const BoxShadow(color: KBlackcolor,),
        ),
      ),
    );
  }
}
