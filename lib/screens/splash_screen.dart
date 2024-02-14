import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:whatsappstatussaver/screens/main_activity.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainActivity()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align to the top
          children: [
            const SizedBox(height: 120,),
            Expanded( // Wrap the image with an Expanded widget
              flex: 0, // Set flex to 0 to prevent the image from taking extra space
              child: Image.asset(
                'assets/3d-fluency-whatsapp-logo.png',
                width: 150, // Adjust width as needed
                height: 150, // Adjust height as needed
              ),
            ),
            const SizedBox(height: 16), // Add some spacing between the image and text
            const Text(
              'WhatsApp Status',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 60,),
            TextLiquidFill(
              waveDuration: const Duration(seconds: 1),
              loadDuration: const Duration(seconds: 3),
              boxHeight: 90,
              text: "Downloader",
              waveColor: const Color.fromARGB(255, 15, 225, 25),
              boxBackgroundColor: Colors.white.withOpacity(0.9),
              textStyle: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
