import 'package:flutter/material.dart';
import 'package:riverpod_state_management/pages/user_page.dart';
import 'counter.dart';
import 'images.dart';
import 'number.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List pages = [UserPage(), CounterPage(), ImagePage(), NumberPage()];
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[200],
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              label: "User",
              icon: Icon(
                Icons.person,
              )),
          BottomNavigationBarItem(
              label: "Counter",
              icon: Icon(
                Icons.add,
              )),
          BottomNavigationBarItem(
              label: "Images",
              icon: Icon(
                Icons.image,
              )),
          BottomNavigationBarItem(
              label: "Random",
              icon: Icon(
                Icons.games,
              )),
        ],
      ),
    );
  }
}
