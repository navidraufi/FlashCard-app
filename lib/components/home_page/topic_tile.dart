import 'package:flutter/material.dart';
import 'package:message_app/animations/fade_in_animations.dart';
import 'package:message_app/configs/constants.dart';
import 'package:message_app/utils/methods.dart';

class TopicTile extends StatelessWidget {
  final String topic;
  const TopicTile({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        loadSession(context: context, valuePassed: topic);
      },
      child: FadeInAnimation(
        child: Container(
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                        tag: topic,
                        child: Image.asset('assets/images/$topic.png')),
                  ),
                ),
                Expanded(
                  child: Text(topic),
                ),
              ],
            )),
      ),
    );
  }
}
