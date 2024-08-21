import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/image_widget.dart';


class StoreCardWidget extends StatelessWidget {
  final String image;
  const StoreCardWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(size.width * 0.023),child: ImageWidget(image: image ,width: size.width * 0.383,height: size.width * 0.519));
  }
}
