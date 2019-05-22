import 'package:news_flutter_app/screens/TopicScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
          children: <Widget>[
            new Offstage(
              offstage: _selectedIndex != 0,
              child: new TickerMode(
                enabled: _selectedIndex == 0,
                child: TopicScreen(),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                this._selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text("Favorites")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Setting')
              )
            ])
    );
  }
}