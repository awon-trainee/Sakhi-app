import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';
import '../../core/theme/colors.dart';
class EmptyWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const EmptyWidget({Key? key, required this.image, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/$image',scale: size.width*0.01,),
          SizedBox(height: size.width * 0.047),
          TextWidget(
            text: title,
            fontSize:  size.width * 0.042,

            fontWeight: FontWeight.bold,
            color: blackColor,
          ),
          SizedBox(height: size.width * 0.017),
          TextWidget(
            text: subtitle,
            fontSize: size.width * 0.037,
            fontWeight: FontWeight.w400,
            color: darkGreyColor,
          )

        ],
      ),
    );
  }
}
