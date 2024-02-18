
import 'package:flutter/material.dart';
import 'package:message_app/animations/fade_in_animations.dart';

import '../configs/constants.dart';

class AppBarBtn extends StatelessWidget {
  const AppBarBtn({
    super.key,
    required this.size,
    required this.iconPath,
    required this.btnFunction,
  });

  final Size size;
  final IconData iconPath;
  // ignore: prefer_typing_uninitialized_variables
  final btnFunction;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: Column(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: btnFunction,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: size.width * kIconPadding,
                child: Icon(
                  iconPath,
                  color: kWhiteColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * kIconPadding,
          )
        ],
      ),
    );
  }
}
