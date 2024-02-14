import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsappstatussaver/provider/bottom_nav_provider.dart';
import 'package:whatsappstatussaver/provider/getstatusprovider.dart';
import 'package:whatsappstatussaver/screens/bottomnavpages.dart/image/image.dart';
import 'package:whatsappstatussaver/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => GetStatusProvider()),
      ],
      child: MaterialApp(
        title: 'Your App Name',
        theme: ThemeData(
          // Your theme data
        ),
        home: SplashScreen(),
      ),
    );
  }
}
