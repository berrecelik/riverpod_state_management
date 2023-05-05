import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_state_management/provider/provider.dart';

class NumberPage extends ConsumerWidget {
  const NumberPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbers = ref.watch(numbersProvider);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: Text("Random Number Generator",
              style: GoogleFonts.philosopher(fontSize: 22))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          ref
              .read(numbersProvider.notifier)
              .add('Number ${Random().nextInt(100)}');
        },
        child: Icon(
          Icons.add,
          color: Colors.greenAccent,
        ),
      ),
      body: Center(
        child: Column(
          children: numbers
              .map((e) => GestureDetector(
                    onLongPress: () {
                      ref.read(numbersProvider.notifier).update(
                          e,
                          '${e} ' +
                              'and Number ' +
                              Random().nextInt(100).toString());
                    },
                    onTap: () {
                      ref.read(numbersProvider.notifier).remove(e);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(e),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
