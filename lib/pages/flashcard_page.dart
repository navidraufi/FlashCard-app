import 'package:flutter/material.dart';
import 'package:message_app/animations/half_flip_animation.dart';
import 'package:message_app/animations/slide_animation.dart';
import 'package:message_app/components/flash_cards_page/card1.dart';
import 'package:message_app/components/flash_cards_page/card2.dart';
import 'package:message_app/enums/slide_direction.dart';
import 'package:message_app/notifiers/flashcard_notifier.dart';
import 'package:message_app/pages/home_page.dart';
import 'package:provider/provider.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FlashcardsNotifier>(context, listen: false).runSlideCard1();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => Scaffold(
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
                tag: notifier.topic,
                child: Image.asset("assets/images/${notifier.topic}.png")),
          ),
          title: Text(notifier.topic),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: IgnorePointer(
            ignoring: notifier.ignoreTouches,
            child: Stack(children: [Card2(), Card1()])),
      ),
    );
  }
}
