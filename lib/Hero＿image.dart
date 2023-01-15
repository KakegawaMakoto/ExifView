import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final Image image;
  final VoidCallback? onTap;

  HeroImage({
    required this.image,
    this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InteractiveViewer(
        maxScale: 10,
        minScale: 0.1,
        child: Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 10),
          child: Container(
            //height:  150,
            child: Hero(tag: "Image",
                child: Material(
                  color: Colors.white60,
                  child: InkWell(
                    onTap: onTap,
                    child: image,
                  ),
                )
            ),
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