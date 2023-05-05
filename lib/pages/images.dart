import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("IMAGES", style: GoogleFonts.philosopher(fontSize: 27)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: "tag1",
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => PageRoute()));
                },
                child: ClipRRect(
                  child: Image.asset(
                    'images/2.jpg',
                    width: 280,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Hero(
              tag: "tag2",
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => PageRoute2()));
                },
                child: ClipRRect(
                  child: Image.asset(
                    'images/3.jpg',
                    width: 280,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class PageRoute extends StatelessWidget {
  const PageRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
          tag: "tag1",
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset('images/2.jpg'))),
    );
  }
}

class PageRoute2 extends StatelessWidget {
  const PageRoute2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: "tag2",
        child: GestureDetector(
          child: Image.asset('images/3.jpg'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
