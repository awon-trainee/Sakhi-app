import 'package:flutter/material.dart';
import 'package:sakhi_app/common/widgets/text_widget.dart';

import '../../core/theme/colors.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const ButtonWidget({Key? key,  this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        width: size.width*0.855,
        height: size.width*0.131,
        child: ElevatedButton(

          style: OutlinedButton.styleFrom(
            backgroundColor:onPressed == null ? lightBlueColor.withOpacity(0.5): lightBlueColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size.width *  0.019),
            ),
          ),
          onPressed: onPressed,
          child: TextWidget(
            text: text,
            color: Colors.white,
            fontSize: size.width*0.040,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
