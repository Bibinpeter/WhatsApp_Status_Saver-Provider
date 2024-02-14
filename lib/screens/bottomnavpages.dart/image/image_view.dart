 
import 'package:flutter/material.dart';
import 'package:whatsappstatussaver/constrains/colors.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key? key});

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  ///List of buttons  
  List<Widget>buttonList=const[
    Icon(Icons.downloading),
    Icon(Icons.print_outlined ),
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
                 print("Print");
                 break;
                 case 2:
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
