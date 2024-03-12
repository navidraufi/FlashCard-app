import 'package:flutter/material.dart';

const radius30 = Radius.circular(30);
const kPrimaryColor = Color(0xff1449EF);
const kSecondaryColor = Color(0xff27DAD7);
const kWhiteColor = Color(0xfff5f5fa);

const kAnimationSlideDuration = 300;

const kIconPadding = 0.06;

var activePage = "";

BoxDecoration cardDesign(BuildContext context) {
  return BoxDecoration(
    border: Border.all(
      color: Colors.white,
      width: 5,
    ),
    boxShadow: [
      BoxShadow(
          color: Theme.of(context).primaryColor,
          blurRadius: 10,
          spreadRadius: 0,
          blurStyle: BlurStyle.outer)
    ],
    gradient: const LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [Color(0xff2980b9), Color(0xff6dd5fa)]),
    borderRadius: BorderRadius.circular(30),
  );
}
