import 'package:flutter/material.dart';
import 'package:netflix_clone/downloads.dart';

import 'package:netflix_clone/fastlaughs.dart';
import 'package:netflix_clone/mainscreen.dart';
import 'package:netflix_clone/upcoming.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  switchScreen(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      const MainScreen(),
      const UpcomingScreen(),
      const FastLaughs(),
      const Downloads(),
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "Upcoming",
            icon: Icon(Icons.ondemand_video_sharp),
          ),
          BottomNavigationBarItem(
            label: "Fast Laughs",
            icon: Icon(Icons.emoji_emotions_rounded),
          ),
          BottomNavigationBarItem(
              label: "Downloads",
              icon: Icon(
                Icons.arrow_circle_down,
              )),
        ],
        onTap: switchScreen,
        currentIndex: selectedIndex,
      ),
    );
  }
}
