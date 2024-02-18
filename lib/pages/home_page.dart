import 'package:flutter/material.dart';
import 'package:message_app/animations/fade_in_animations.dart';
import 'package:message_app/components/appbar_btn.dart';
import 'package:message_app/configs/constants.dart';
import 'package:message_app/components/home_page/topic_tile.dart';
import 'package:message_app/data/words.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _topics = [];

  @override
  void initState() {
    for (var eachTopic in words) {
      // Using IF to Prevent repeated topics

      if (!_topics.contains(eachTopic.topic)) {
        _topics.add(eachTopic.topic);
      }

      _topics.sort();
    }

    // print(_topics);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: radius30,
            bottomLeft: radius30,
          ),
        ),
        toolbarHeight: size.height * 0.15,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBarBtn(
              size: size,
              iconPath: Icons.settings,
              btnFunction: () {},
            ),
            FadeInAnimation(
              child: Text(
                "Flashcards",
                style: TextStyle(color: kWhiteColor),
              ),
            ),
            AppBarBtn(
              size: size,
              iconPath: Icons.reviews,
              btnFunction: () {},
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: FadeInAnimation(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: 100.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("images/course_image.jpg")),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: _topics.length,
                (context, index) => TopicTile(topic: _topics[index]),
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 6, mainAxisSpacing: 6),
            )
          ],
        ),
      ),
    );
  }
}
