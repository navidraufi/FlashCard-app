import 'package:flutter/material.dart';
import 'package:message_app/configs/theme.dart';
import 'package:message_app/pages/home_page.dart';

void main() => runApp(const FlashCard());

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
