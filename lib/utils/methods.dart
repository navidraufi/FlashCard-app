import 'package:flutter/material.dart';
import 'package:message_app/configs/constants.dart';
import 'package:message_app/pages/flashcard_page.dart';

loadSession({required BuildContext context, required valuePassed}) {
  activePage = valuePassed;
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => const FlashcardsPage()),
  );
}
