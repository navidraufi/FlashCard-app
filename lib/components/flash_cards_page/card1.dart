import 'package:flutter/material.dart';
import 'package:message_app/animations/half_flip_animation.dart';
import 'package:message_app/animations/slide_animation.dart';
import 'package:message_app/enums/slide_direction.dart';
import 'package:message_app/notifiers/flashcard_notifier.dart';
import 'package:provider/provider.dart';

class Card1 extends StatelessWidget {
  const Card1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => GestureDetector(
        onDoubleTap: () {
          notifier.runFlipCard1();
          notifier.setIgnoreTouch(ignore: true);
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          flipFromHalfWay: false,
          animationCompleted: () {
            notifier.resetCard1();
            notifier.runFlipCard2();
          },
          child: SlideAnimation(
            animationCompleted: () {
              notifier.setIgnoreTouch(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slideCard1,
            direction: SlideDirection.upIn,
            child: Center(
              child: Container(
                child: Text("Front OF the CARD"),
                height: size.height * 0.70,
                width: size.width * 0.90,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
