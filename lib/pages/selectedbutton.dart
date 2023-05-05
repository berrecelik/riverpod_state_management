import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_state_management/provider/provider.dart';

class SelectedButton extends ConsumerWidget {
  const SelectedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRed = ref.watch(isRedProvider);
    final selectedButton = ref.watch(selectedButtonProvider);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(selectedButton.toUpperCase() + " is selected",
                style: GoogleFonts.philosopher(
                  fontSize: 25,
                )),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.red[700])),
                onPressed: () =>
                    ref.read(selectedButtonProvider.notifier).state = 'red',
                child: Text("Red",
                    style: GoogleFonts.philosopher(
                      fontSize: 20,
                    ))),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[700])),
                onPressed: () =>
                    ref.read(selectedButtonProvider.notifier).state = 'blue',
                child: Text("Blue",
                    style: GoogleFonts.philosopher(
                      fontSize: 20,
                    ))),
            isRed
                ? Text(
                    "Color is red",
                    style: GoogleFonts.philosopher(
                        fontSize: 20, color: Colors.red),
                  )
                : Text(
                    "Color is blue",
                    style: GoogleFonts.philosopher(
                        fontSize: 20, color: Colors.blue),
                  )
          ],
        ),
      ),
    );
  }
}
