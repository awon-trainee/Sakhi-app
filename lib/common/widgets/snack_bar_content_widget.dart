import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';

class SnackBarContentWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? subText;
  const SnackBarContentWidget({
    Key? key,
    required this.icon,
    required this.text, this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        SizedBox(width: size.width * 0.07),
        subText != ''?  TextWidget(
          text: text,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ):
        Column(
          children: [
            TextWidget(
              text: text,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            TextWidget(
              text: subText!,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}
