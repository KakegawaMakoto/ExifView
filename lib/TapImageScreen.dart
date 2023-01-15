import 'package:exifview/Hero%EF%BC%BFimage.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

class TapImageScreen extends StatelessWidget {
  final Image image;
  TapImageScreen({required this.image,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black38,
        ),
        body: Center(
          child: HeroImage(
            image: image,
            onTap: (){
              Navigator.pop(context);
            }
          ),
        ),
      ),
    );
  }
}


// : Padding(
//     padding: const EdgeInsets.only(top: 10),
//     child: Container(
//       child: SizedBox(
//         height: 150,
//         child: Image.file(
//           image!,
//           fit: BoxFit.scaleDown,
//         ),
//       ),
//
//     ),
//   ),