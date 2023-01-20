import 'package:flutter/material.dart';

import 'Constants.dart';


class IconContent extends StatelessWidget {
  IconContent({required this.IconLook,required this.Label});
  final IconData IconLook;
  final String Label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          IconLook,
          size: 50.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          Label,style: labelTextStyle,
        ),
      ],
    );
  }
}
