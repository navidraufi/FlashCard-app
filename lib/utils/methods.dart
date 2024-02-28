import 'package:flutter/material.dart';
import 'package:message_app/notifiers/flashcard_notifier.dart';
import 'package:message_app/pages/flashcard_page.dart';
import 'package:provider/provider.dart';

loadSession({required BuildContext context, required String topic}) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => const FlashcardsPage()),
  );

  Provider.of<FlashcardsNotifier>(context, listen: false)
      .setTopic(topic: topic);
}
