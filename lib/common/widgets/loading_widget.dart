import 'package:flutter/material.dart';

import '../../core/theme/colors.dart';


class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
          backgroundColor:blueColor,
          strokeWidth: 4,
          color: lowLightBlueColor,

        ));
  }
}

