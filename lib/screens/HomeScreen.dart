import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (int index) {
              setState(() {
                this.index = index;
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