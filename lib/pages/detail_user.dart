// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_state_management/pages/counter.dart';
import 'package:riverpod_state_management/pages/selectedbutton.dart';
import '../models/user_model.dart';
import 'number.dart';

class DetailUser extends StatelessWidget {
  final User user;
  const DetailUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("User", style: GoogleFonts.philosopher(fontSize: 30)),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(user.avatar!),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            user.firstName! + " " + user.lastName!,
            style: GoogleFonts.philosopher(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            user.email!,
            style: GoogleFonts.philosopher(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Expanded(child: SelectedButton()),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => NumberPage()));
              },
              child: Text("Random Number Generator",
                  style: GoogleFonts.philosopher(fontSize: 20))),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => CounterPage()));
              },
              child: Text("Counter",
                  style: GoogleFonts.philosopher(fontSize: 20))),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
