import 'package:news_flutter_app/model/Posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class PostScreen extends StatefulWidget {
  final String title;

  const PostScreen({Key key, this.title}) : super(key: key);

  @override
  PostScreenState createState() => new PostScreenState(this.title);
}

class PostScreenState extends State<PostScreen> {
  final String topic;
  List<Posts> posts = new List<Posts>();

  PostScreenState(this.topic);

  _renderBody() {
    if (topic == 'VolleyBall') {
      posts.add(new Posts(
          'فهرست 25 نفره ایران برای حضور در لیگ ملت‌ های والیبال مشخص شد',
          '/node/1308003',
          '25',
          'https://www.tarafdari.com/sites/default/files/contents/user359161/news/1749689.jpg'));
      posts.add(new Posts(
          'تیم ملی والیبال بانوان؛ پرامیدترین تیم تاریخ با حضور لژیونرها',
          '/node/1307047',
          '40',
          'https://www.tarafdari.com/sites/default/files/contents/user561808/news/tym-mly-wlybl-bnwn.jpg'));
    } else {
      posts.add(new Posts(
          'از مسی و رونالدو تا جیمز و فدرر؛ فوق ستارگانی که دوست نداریم، دوران آن ها تمام شود',
          '/node/1308756',
          '30',
          'https://www.tarafdari.com/sites/default/files/contents/user389018/news/messi-ronaldo-stars.jpg'));
      posts.add(new Posts(
          'با اعلام کمیته انضباطی فدراسیون بسکتبال، باشگاه شهرداری تبریز از فعالیت در بسکتبال محروم شد',
          '/node/1308081',
          '35',
          'https://www.tarafdari.com/sites/default/files/contents/user359161/news/1396112316110058513324294.jpg'));
    }
    return PostsList(posts: posts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts from $topic'),
        ),
        body: _renderBody());
  }
}

class PostsList extends StatelessWidget {
  final List<Posts> posts;
  final String defaultUrl =
      "https://www.tarafdari.com/sites/all/modules/firebase/images/logo.png";

  const PostsList({Key key, this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var image = posts[index].iconImg.length > 0
              ? posts[index].iconImg
              : defaultUrl;
          var title = posts[index].title.length > 50
              ? "${posts[index].title.substring(0, 40)}..."
              : posts[index].title;
          var score = posts[index].score;
          var link = posts[index].permalink;
          final cardIcon = Container(
            padding: const EdgeInsets.all(16.0),
            margin: EdgeInsets.symmetric(vertical: 16.0),
            alignment: FractionalOffset.centerLeft,
            child: Image.network(image, height: 64.0, width: 64.0),
          );
          var cardContent = Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(5.0),
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title), Text("Score: $score")],
            ),
          );
          return InkWell(
            onTap: () {
              _launchURL(context, "https://www.tarafdari.com$link");
            },
            child: Card(
              margin: EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[cardIcon, cardContent],
              ),
            ),
          );
        });
  }

  void _launchURL(BuildContext context, String url) async {
    try {
      await launch(url,
          option: new CustomTabsOption(
            toolbarColor: Theme.of(context).primaryColor,
            enableDefaultShare: true,
            enableUrlBarHiding: true,
            showPageTitle: true,
            animation: new CustomTabsAnimation(
              startEnter: 'slide_up',
              startExit: 'android:anim/fade_out',
              endEnter: 'android:anim/fade_in',
              endExit: 'slide_down',
            ),
          ));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
