// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_state_management/pages/counter.dart';
import 'package:riverpod_state_management/pages/images.dart';
import 'package:riverpod_state_management/pages/selectedbutton.dart';
import '../models/user_model.dart';
import 'number.dart';

class DetailUser extends StatefulWidget {
  final User user;
  const DetailUser({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<DetailUser> createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  bool _isSelected = false;
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("User", style: GoogleFonts.philosopher(fontSize: 30)),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Text('Switch',
                  style: GoogleFonts.philosopher(
                      fontSize: 20, color: Colors.white)))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(widget.user.avatar!),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.user.firstName! + " " + widget.user.lastName!,
            style: GoogleFonts.philosopher(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.user.email!,
            style: GoogleFonts.philosopher(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Visibility(
            visible: _isVisible,
            child: ChoiceChip(
              selectedColor: Colors.greenAccent,
              label: Text("Join",
                  style: GoogleFonts.philosopher(
                    fontSize: 16,
                  )),
              selected: _isSelected,
              onSelected: (value) {
                setState(() {
                  _isSelected = value;
                });
              },
            ),
          ),
          Expanded(child: SelectedButton()),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ImagePage()));
              },
              child:
                  Text("Images", style: GoogleFonts.philosopher(fontSize: 20))),
          SizedBox(
            height: 10,
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
            height: 10,
          ),
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
        ],
      ),
    );
  }
}
