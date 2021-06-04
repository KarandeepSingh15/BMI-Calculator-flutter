import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function ontap;
  BottomButton({@required this.title, @required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            title,
            style: kLargeTextStyle,
          ),
        ),
        color: kContainerColor,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: 15),
        width: double.infinity,
      ),
    );
  }
}
