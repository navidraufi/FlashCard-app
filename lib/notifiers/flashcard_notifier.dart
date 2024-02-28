import 'package:flutter/material.dart';
import 'package:message_app/enums/slide_direction.dart';

class FlashcardsNotifier extends ChangeNotifier {
  String topic = "";

  setTopic({required String topic}) {
    this.topic = topic;
    notifyListeners();
  }

  bool ignoreTouches = true;
  setIgnoreTouch({required bool ignore}) {
    ignoreTouches = ignore;
    notifyListeners();
  }

  SlideDirection swipedDirection = SlideDirection.none;

  bool slideCard1 = false,
      flipCard1 = false,
      flipCard2 = false,
      swipeCard2 = false;

  bool resetSlideCard1 = false,
      resetFlipCard1 = false,
      resetFlipCard2 = false,
      resetSwipeCard2 = false;

  runSlideCard1() {
    resetSlideCard1 = false;
    slideCard1 = true;
    notifyListeners();
  }

  runFlipCard1() {
    resetFlipCard1 = false;
    flipCard1 = true;
    notifyListeners();
  }

  resetCard1() {
    resetFlipCard1 = true;
    resetSlideCard1 = true;
    slideCard1 = false;
    flipCard1 = false;
  }

  runFlipCard2() {
    resetFlipCard2 = false;
    flipCard2 = true;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}) {
    resetSwipeCard2 = false;
    swipedDirection = direction;
    swipeCard2 = true;
    notifyListeners();
  }

  resetCard2() {
    resetFlipCard2 = true;
    resetSwipeCard2 = true;
    flipCard2 = false;
    swipeCard2 = false;
  }
}
