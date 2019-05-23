import 'package:news_flutter_app/model/Topics.dart';
import 'package:news_flutter_app/screens/PostsScreen.dart';
import 'package:news_flutter_app/styles/MainStyle.dart';
import 'package:flutter/material.dart';

class TopicScreen extends StatefulWidget {
  @override
  TopicScreenState createState() => new TopicScreenState();
}

class TopicScreenState extends State<TopicScreen> {
  List<Topics> topics = new List<Topics>();

  _renderBody() {
    topics.add(new Topics('https://www.tarafdari.com/taxonomy/term/19013',
        'BasketBall', 'Play with hands!', ''));
    topics.add(new Topics('https://www.tarafdari.com/taxonomy/term/22960',
        'VolleyBall', 'Play with hands!', ''));
    return TopicsList(topics: topics);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tarafdari News'),
        ),
        body: _renderBody());
  }
}

class TopicsList extends StatelessWidget {
  final List<Topics> topics;
  final String defaultUrl =
      "https://www.tarafdari.com/sites/all/modules/firebase/images/logo.png";

  const TopicsList({Key key, this.topics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          var image = topics[index].iconImg.length > 0
              ? topics[index].iconImg
              : defaultUrl;
          var title = topics[index].displayName;
          var desc = topics[index].publicDescription;
          final cardIcon = Container(
            padding: const EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(vertical: 16.0),
            alignment: FractionalOffset.centerLeft,
            child: Image.network(image, height: 64.0, width: 64.0),
          );
          var cardText = Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  child: new Text(title, style: headerTextStyle),
                  padding: EdgeInsets.only(bottom: 15.0),
                ),
                Text(desc.length > 32 ? "${desc.substring(0, 32)}..." : desc)
              ],
            ),
          );
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PostScreen(title: title)));
            },
            child: Card(
              margin: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                children: <Widget>[cardIcon, cardText],
              ),
            ),
          );
        });
  }
}
