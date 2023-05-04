// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_state_management/provider/provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      body: Center(
        child:
            Text('Value: $value', style: GoogleFonts.philosopher(fontSize: 40)),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () => ref.read(counterStateProvider.state).state++,
                child: Icon(Icons.add)),
            Expanded(child: Container()),
            FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () => ref.read(counterStateProvider.state).state--,
              child: Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
