import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final double width;
  final double height;

  const ImageWidget(
      {Key? key,
        required this.image,
        required this.width,
        required this.height,
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInImage(

        placeholder: const AssetImage('assets/images/image_placeholder.png'),
        image:NetworkImage(image),
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset('assets/images/image_placeholder.png',
              width: width != 0.0 ? width : null,
              height: height != 0.0 ? height : null);
        },
        fit: BoxFit.fill,
        width: width != 0.0 ? width : null,
        height: height != 0.0 ? height : null);
  }
}
