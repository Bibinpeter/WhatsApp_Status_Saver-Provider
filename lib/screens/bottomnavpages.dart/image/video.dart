import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:whatsappstatussaver/constrains/colors.dart';
import 'package:whatsappstatussaver/provider/getstatusprovider.dart';

import 'package:whatsappstatussaver/screens/bottomnavpages.dart/image/video_view.dart';

class VideoHome extends StatefulWidget {
  const VideoHome({Key? key}) : super(key: key);

  @override
  State<VideoHome> createState() => _VideoHomeState();
}

class _VideoHomeState extends State<VideoHome> {
  bool _isFetched = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      fetchImages();
    });
  }

  void fetchImages() {
    final getStatusProvider =
        Provider.of<GetStatusProvider>(context, listen: false);
    getStatusProvider.getStatus(".jpg");
    setState(() {
      _isFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<GetStatusProvider>(
        builder: (context, file, _) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Center(
                child: Text(
                  "Photos",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: KBlackcolor,
                  ),
                ),
              ),
            ),
            body: file.isWhatsAppAvaliable == false
                ? const Center(child: Text("WhatsApp not available"))
                : file.getImages.isEmpty
                    ? const Center(child: Text("No images available"))
                    : GridView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(16.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16.0,
                          mainAxisSpacing: 16.0,
                        ),
                        children: List.generate(
                          file.getImages.length,
                          (index) {
                            final data = file.getImages[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const VideoView(),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 201, 191, 194),
                                  image: DecorationImage(
                                    image: FileImage(File(data.path)),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: KGreen.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          );
        },
      ),
    );
  }
}
