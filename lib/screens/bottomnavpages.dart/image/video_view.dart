 
import 'package:flutter/material.dart';
import 'package:whatsappstatussaver/constrains/colors.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, Key? ky});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  ///List of buttons  
  List<Widget>buttonList=const[
    Icon(Icons.downloading),
    Icon(Icons.send),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Kgrey,
        ),
      ),
      floatingActionButton: Padding(
        padding:  const EdgeInsets.only(left:25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(buttonList.length, (index) {
            return  FloatingActionButton(
              heroTag: "$index",
              onPressed: () {
               switch(index){
                case 0:
                  print("download image");
                 break;
                 case 1:
                 print("share");
                 break;
               }
              },
              backgroundColor:KBlackcolor, // Change the color here
              child: buttonList[index],
            );
          })
        ),
      ),
    );
  }
}
