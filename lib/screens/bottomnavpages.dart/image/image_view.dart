import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:whatsappstatussaver/constrains/colors.dart';

class ImageView extends StatefulWidget {
  final String? imagePath;
  const ImageView({Key? key, this.imagePath});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  ///List of buttons
  List<Widget> buttonList = const [
    Icon(Icons.downloading),
    Icon(Icons.print_outlined),
    Icon(Icons.send),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(File(widget.imagePath!)),
            fit: BoxFit.scaleDown,
          ),
          color: Color.fromARGB(255, 41, 41, 41),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(buttonList.length, (index) {
              return FloatingActionButton(
                heroTag: "$index",
                onPressed: () async {
                  switch (index) {
                    case 0:
                      print("download image");
                      ImageGallerySaver.saveFile(widget.imagePath!)
                          .then((value) => {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Image Saved 👍"),
                                  backgroundColor: KGreen,
                                ))
                              });
                      break;
                    case 1:
                      print("Print");
                      FlutterNativeApi.printImage(widget.imagePath!,widget.imagePath!.split("/").last );
                      break;
                    case 2:
                      print("share");
                FlutterNativeApi.shareImage(widget.imagePath!);
                      break;
                  }
                },
                backgroundColor: KBlackcolor, // Change the color here
                child: buttonList[index],
              );
            })),
      ),
    );
  }
}
