import 'dart:math';

import 'package:flutter/material.dart';
import 'package:message_app/animations/half_flip_animation.dart';
import 'package:message_app/animations/slide_animation.dart';
import 'package:message_app/components/flash_cards_page/tts_btn.dart';
import 'package:message_app/configs/constants.dart';
import 'package:message_app/enums/slide_direction.dart';
import 'package:message_app/notifiers/flashcard_notifier.dart';
import 'package:provider/provider.dart';

class Card2 extends StatelessWidget {
  const Card2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 100) {
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
          if (details.primaryVelocity! < -100) {
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: () {
            notifier.setIgnoreTouch(ignore: false);
          },
          child: SlideAnimation(
            animationCompleted: () {
              notifier.resetCard2();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            direction: notifier.swipedDirection,
            child: Center(
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(notifier.word2.character))),
                      TTSButton()
                    ],
                  ),
                  height: size.height * 0.70,
                  width: size.width * 0.90,
                  decoration: cardDesign(context),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
