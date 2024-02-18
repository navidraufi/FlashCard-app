import 'package:flutter/material.dart';
import 'package:message_app/configs/constants.dart';
import 'package:message_app/pages/home_page.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                  (route) => false);
            },
            icon: const Icon(Icons.clear_rounded),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
              tag: activePage,
              child: Image.asset("assets/images/$activePage.png")),
        ),
        title: Text(activePage),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
