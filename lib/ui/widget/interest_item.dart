// ignore_for_file: prefer_const_constructors

import '/shared/theme.dart';
import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String text;
  const InterestItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 16,
            width: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: blackTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
