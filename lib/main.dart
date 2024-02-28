import 'package:flutter/material.dart';
import 'package:message_app/configs/theme.dart';
import 'package:message_app/notifiers/flashcard_notifier.dart';
import 'package:message_app/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        child: const FlashCard(),
        providers: [
          ChangeNotifierProvider(create: (_) => FlashcardsNotifier())
        ],
      ),
    );

class FlashCard extends StatelessWidget {
  const FlashCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flash Card",
      theme: appTheme,
      home: const HomePage(),
    );
  }
}
