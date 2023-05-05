import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_state_management/pages/home_page.dart';
import 'package:riverpod_state_management/pages/user_page.dart';
import 'package:riverpod_state_management/provider/provider.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  PageController pageController = new PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(welcomeProvider);
    return Container(
      color: Colors.black26,
      child: SafeArea(
          child: Scaffold(
        body: Container(
            child: Stack(
          alignment: Alignment.topCenter,
          children: [
            PageView(
              scrollDirection: Axis.horizontal,
              reverse: false,
              onPageChanged: (index) {
                ref.read(welcomeProvider.notifier).pageChanged(index);
              },
              controller: pageController,
              pageSnapping: true,
              physics: ClampingScrollPhysics(),
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.deepPurple[100],
                      width: 400,
                      height: 400,
                      child: Center(
                          child: Text(
                        "1",
                        style: GoogleFonts.philosopher(fontSize: 30),
                      )),
                    ),
                    Expanded(
                      child: Center(
                          child: Text("Hi there !",
                              style: GoogleFonts.philosopher(fontSize: 25))),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.pink[100],
                      width: 400,
                      height: 400,
                      child: Center(
                          child: Text(
                        "2",
                        style: GoogleFonts.philosopher(fontSize: 30),
                      )),
                    ),
                    Expanded(
                      child: Center(
                          child: Text("Welcome !",
                              style: GoogleFonts.philosopher(fontSize: 25))),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.amber[100],
                      width: 400,
                      height: 400,
                      child: Center(
                          child: Text(
                        "3",
                        style: GoogleFonts.philosopher(fontSize: 30),
                      )),
                    ),
                    Expanded(
                        child: Center(
                            child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber[100])),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => HomePage()));
                      },
                      child: Text(
                        "Start",
                        style: GoogleFonts.philosopher(
                            fontSize: 25, color: Colors.black),
                      ),
                    )))
                  ],
                ),
              ],
            ),
            Positioned(
                child: DotsIndicator(
              dotsCount: 3,
              mainAxisAlignment: MainAxisAlignment.center,
              reversed: false,
              position: state.page.toInt(),
              decorator: DotsDecorator(
                  color: Colors.green,
                  activeColor: Colors.orangeAccent,
                  size: Size.square(8),
                  activeSize: Size(18, 8),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
            ))
          ],
        )),
      )),
    );
  }
}
